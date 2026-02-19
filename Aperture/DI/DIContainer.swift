import Foundation
import Swinject

public typealias DIContainer = Swinject.Container
public typealias ResolverType = Swinject.Resolver

public extension Swinject.Resolver {

  func resolveRequired<T>(_ type: T.Type) -> T {
    guard let value = resolve(type) else {
      fatalError("DI: Could not resolve \(type)")
    }
    return value
  }

}
