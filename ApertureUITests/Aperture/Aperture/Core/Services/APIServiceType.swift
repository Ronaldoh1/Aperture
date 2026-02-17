import Combine
import Foundation

// MARK: - Protocol

protocol APIServiceType {
  func get<T: Decodable>(endpoint: String) -> AnyPublisher<T, Error>
  func post<T: Decodable>(endpoint: String, body: [String: Any]) -> AnyPublisher<T, Error>
  func put<T: Decodable>(endpoint: String, body: [String: Any]) -> AnyPublisher<T, Error>
  func delete(endpoint: String) -> AnyPublisher<Void, Error>
}

// MARK: - Implementation

class APIService: APIServiceType {
  // MARK: - Properties

  private let baseURL: String
  private let session: URLSession
  private let decoder: JSONDecoder

  // MARK: - Initialization

  init(
    baseURL: String = "https://api.sunflow.reignited.com",
    session: URLSession = .shared
  ) {
    self.baseURL = baseURL
    self.session = session
    decoder = JSONDecoder()

    // Configure decoder
    decoder.dateDecodingStrategy = .iso8601
  }

  // MARK: - APIService Methods

  func get<T: Decodable>(endpoint: String) -> AnyPublisher<T, Error> {
    guard let url = URL(string: baseURL + endpoint) else {
      return Fail(error: AppError.networkError("Invalid URL"))
        .eraseToAnyPublisher()
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    addHeaders(to: &request)

    return performRequest(request)
  }

  func post<T: Decodable>(endpoint: String, body: [String: Any]) -> AnyPublisher<T, Error> {
    guard let url = URL(string: baseURL + endpoint) else {
      return Fail(error: AppError.networkError("Invalid URL"))
        .eraseToAnyPublisher()
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    addHeaders(to: &request)

    do {
      request.httpBody = try JSONSerialization.data(withJSONObject: body)
    } catch {
      return Fail(error: AppError.encodingError)
        .eraseToAnyPublisher()
    }

    return performRequest(request)
  }

  func put<T: Decodable>(endpoint: String, body: [String: Any]) -> AnyPublisher<T, Error> {
    guard let url = URL(string: baseURL + endpoint) else {
      return Fail(error: AppError.networkError("Invalid URL"))
        .eraseToAnyPublisher()
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    addHeaders(to: &request)

    do {
      request.httpBody = try JSONSerialization.data(withJSONObject: body)
    } catch {
      return Fail(error: AppError.encodingError)
        .eraseToAnyPublisher()
    }

    return performRequest(request)
  }

  func delete(endpoint: String) -> AnyPublisher<Void, Error> {
    guard let url = URL(string: baseURL + endpoint) else {
      return Fail(error: AppError.networkError("Invalid URL"))
        .eraseToAnyPublisher()
    }

    var request = URLRequest(url: url)
    request.httpMethod = "DELETE"
    addHeaders(to: &request)

    return session.dataTaskPublisher(for: request)
      .tryMap { _, response in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw AppError.networkError("Invalid response")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
          throw AppError.serverError("Status code: \(httpResponse.statusCode)")
        }

        return ()
      }
      .eraseToAnyPublisher()
  }

  // MARK: - Private Helpers

  private func addHeaders(to request: inout URLRequest) {
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")

    // Add auth token if available
    if let token = UserDefaults.standard.string(forKey: "auth_token") {
      request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    }
  }

  private func performRequest<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, Error> {
    session.dataTaskPublisher(for: request)
      .tryMap { data, response in
        guard let httpResponse = response as? HTTPURLResponse else {
          throw AppError.networkError("Invalid response")
        }

        guard (200...299).contains(httpResponse.statusCode) else {
          throw AppError.serverError("Status code: \(httpResponse.statusCode)")
        }

        return data
      }
      .decode(type: T.self, decoder: decoder)
      .mapError { error in
        if error is DecodingError {
          return AppError.decodingError
        }

        return error
      }
      .eraseToAnyPublisher()
  }
}
