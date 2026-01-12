import SwiftUI

struct AuthView: View {
    
    
    @StateObject private var viewModel: AuthViewModelObservable
    
    
    init(presenter: AuthPresenterType) {
        
        _viewModel = StateObject(wrappedValue: AuthViewModelObservable(presenter: presenter))
    }
    
    
    var body: some View {
        
        ZStack {
            
            // MARK: - Background
            cosmicBackground
            
            // MARK: - Content
            ScrollView {
                
                VStack(spacing: 40) {
                    
                    // MARK: - Header
                    headerSection
                    
                    // MARK: - Form
                    formSection
                    
                    // MARK: - Action Button
                    actionButton
                    
                    // MARK: - Toggle Mode
                    toggleModeButton
                    
                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 24)
                .padding(.top, 60)
            }
            
            // MARK: - Loading Overlay
            if viewModel.isLoading {
                
                LoadingOverlay(message: viewModel.loadingMessage)
            }
        }
        .alert("Error", isPresented: $viewModel.showError) {
            
            Button("OK", role: .cancel) { }
        } message: {
            
            Text(viewModel.errorMessage)
        }
        .onAppear {
            
            viewModel.onAppear()
        }
    }
    
    
    // MARK: - Cosmic Background
    private var cosmicBackground: some View {
        
        ZStack {
            
            LinearGradient(
                colors: [
                    Color(red: 0.05, green: 0.0, blue: 0.15),
                    Color(red: 0.1, green: 0.05, blue: 0.2),
                    Color(red: 0.15, green: 0.1, blue: 0.25)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            SacredGeometryView()
                .opacity(0.15)
        }
        .ignoresSafeArea()
    }
    
    
    // MARK: - Header Section
    private var headerSection: some View {
        
        VStack(spacing: 16) {
            
            Image(systemName: "sun.max.fill")
                .font(.system(size: 80))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 0.8, blue: 0.2),
                            Color(red: 1.0, green: 0.5, blue: 0.0)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color.orange.opacity(0.5), radius: 20)
            
            Text(viewModel.isSignUpMode ? "Create Account" : "Welcome Back")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(viewModel.isSignUpMode ? "Begin your journey" : "Continue your path")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
        }
    }
    
    
    // MARK: - Form Section
    private var formSection: some View {
        
        VStack(spacing: 20) {
            
            CosmicTextField(
                text: $viewModel.email,
                placeholder: "Email",
                iconName: "envelope.fill",
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )
            
            CosmicSecureField(
                text: $viewModel.password,
                placeholder: "Password",
                iconName: "lock.fill",
                showPassword: $viewModel.showPassword,
                textContentType: viewModel.isSignUpMode ? .newPassword : .password
            )
            
            if viewModel.isSignUpMode {
                
                CosmicSecureField(
                    text: $viewModel.confirmPassword,
                    placeholder: "Confirm Password",
                    iconName: "lock.fill",
                    showPassword: $viewModel.showConfirmPassword,
                    textContentType: .newPassword
                )
            }
        }
    }
    
    
    // MARK: - Action Button
    private var actionButton: some View {
        
        Button(action: {
            
            viewModel.didTapActionButton()
        }) {
            
            HStack(spacing: 12) {
                
                Text(viewModel.isSignUpMode ? "Create Account" : "Sign In")
                    .font(.system(size: 18, weight: .semibold, design: .rounded))
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 16, weight: .semibold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.8, blue: 0.2),
                        Color(red: 1.0, green: 0.5, blue: 0.0)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color.orange.opacity(0.4), radius: 12, y: 4)
        }
        .disabled(!viewModel.isFormValid)
        .opacity(viewModel.isFormValid ? 1.0 : 0.5)
    }
    
    
    // MARK: - Toggle Mode Button
    private var toggleModeButton: some View {
        
        Button(action: {
            
            viewModel.didTapToggleMode()
        }) {
            
            HStack(spacing: 8) {
                
                Text(viewModel.isSignUpMode ? "Already have an account?" : "Don't have an account?")
                    .foregroundColor(.white.opacity(0.7))
                
                Text(viewModel.isSignUpMode ? "Sign In" : "Sign Up")
                    .foregroundColor(.orange)
                    .fontWeight(.semibold)
            }
            .font(.system(size: 15, design: .rounded))
        }
    }
}


// MARK: - View Model Observable
class AuthViewModelObservable: ObservableObject {
    
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var showPassword = false
    @Published var showConfirmPassword = false
    @Published var isSignUpMode = false
    @Published var isLoading = false
    @Published var loadingMessage = ""
    @Published var showError = false
    @Published var errorMessage = ""
    
    
    private let presenter: AuthPresenterType
    
    
    init(presenter: AuthPresenterType) {
        
        self.presenter = presenter
    }
    
    
    func onAppear() {
        
        presenter.viewDidLoad()
    }
    
    
    func didTapActionButton() {
        
        if isSignUpMode {
            
            presenter.didTapSignUp(email: email, password: password)
        } else {
            
            presenter.didTapSignIn(email: email, password: password)
        }
    }
    
    
    func didTapToggleMode() {
        
        presenter.didTapToggleMode()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            
            isSignUpMode.toggle()
            email = ""
            password = ""
            confirmPassword = ""
        }
    }
    
    
    var isFormValid: Bool {
        
        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8
        
        if isSignUpMode {
            
            return emailValid && passwordValid && password == confirmPassword
        } else {
            
            return emailValid && passwordValid
        }
    }
}


// MARK: - AuthViewType Conformance
extension AuthViewModelObservable: AuthViewType {
    
    
    func display(_ viewModel: AuthViewModel) {
        
        DispatchQueue.main.async {
            
            self.isSignUpMode = viewModel.isSignUpMode
        }
    }
    
    
    func displayError(_ error: String) {
        
        DispatchQueue.main.async {
            
            self.errorMessage = error
            self.showError = true
        }
    }
    
    
    func displayLoading(_ message: String) {
        
        DispatchQueue.main.async {
            
            self.isLoading = true
            self.loadingMessage = message
        }
    }
    
    
    func hideLoading() {
        
        DispatchQueue.main.async {
            
            self.isLoading = false
        }
    }
}


// MARK: - Cosmic Text Field
struct CosmicTextField: View {
    
    
    @Binding var text: String
    let placeholder: String
    let iconName: String
    var keyboardType: UIKeyboardType = .default
    var textContentType: UITextContentType? = nil
    
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(systemName: iconName)
                .font(.system(size: 18))
                .foregroundColor(.orange.opacity(0.8))
                .frame(width: 24)
            
            TextField(placeholder, text: $text)
                .font(.system(size: 16, design: .rounded))
                .foregroundColor(.white)
                .keyboardType(keyboardType)
                .textContentType(textContentType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
    }
}


// MARK: - Cosmic Secure Field
struct CosmicSecureField: View {
    
    
    @Binding var text: String
    let placeholder: String
    let iconName: String
    @Binding var showPassword: Bool
    var textContentType: UITextContentType? = nil
    
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(systemName: iconName)
                .font(.system(size: 18))
                .foregroundColor(.orange.opacity(0.8))
                .frame(width: 24)
            
            if showPassword {
                
                TextField(placeholder, text: $text)
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.white)
                    .textContentType(textContentType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            } else {
                
                SecureField(placeholder, text: $text)
                    .font(.system(size: 16, design: .rounded))
                    .foregroundColor(.white)
                    .textContentType(textContentType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            
            Button(action: {
                
                showPassword.toggle()
            }) {
                
                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                    .font(.system(size: 16))
                    .foregroundColor(.orange.opacity(0.6))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.08))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
    }
}


// MARK: - Sacred Geometry View
struct SacredGeometryView: View {
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                ForEach(0..<7) { i in
                    
                    Circle()
                        .stroke(Color.orange.opacity(0.2), lineWidth: 1)
                        .frame(width: 100, height: 100)
                        .offset(
                            x: cos(Double(i) * .pi / 3) * 50,
                            y: sin(Double(i) * .pi / 3) * 50
                        )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
