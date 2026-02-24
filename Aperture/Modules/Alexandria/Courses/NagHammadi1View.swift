import SwiftUI
import WebKit

// MARK: - Nag Hammadi Course I
// Unlocks: Always available (entry course)
// Completion key: "course_nag_hammadi_1_complete"
// Unlocks Course II via: "course_nag_hammadi_1_complete"

struct NagHammadi1View: View {
    @State private var scrollProgress: Double = 0
    @State private var currentModule: String = "The Discovery"
    @State private var showUnlockOverlay = false
    @State private var quizPassed = false
    @State private var quizScore = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            NagHammadi1WebView(
                scrollProgress: $scrollProgress,
                currentModule: $currentModule,
                quizPassed: $quizPassed,
                quizScore: $quizScore,
                showUnlockOverlay: $showUnlockOverlay
            )
            .ignoresSafeArea()

            // Native header
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "#2a9999"))
                            .padding(.leading, 16)
                            .frame(width: 44, height: 44)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("NAG HAMMADI · COURSE I")
                            .font(.custom("Cinzel-Regular", size: 10))
                            .tracking(3)
                            .foregroundColor(Color(hex: "#2a9999"))
                        Text(currentModule)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Color(hex: "#5a4838"))
                            .lineLimit(1)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color(hex: "#2a1f0e").opacity(0.5), lineWidth: 1.5)
                            .frame(width: 28, height: 28)
                        Circle()
                            .trim(from: 0, to: scrollProgress)
                            .stroke(Color(hex: "#1a6b6b"), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            .frame(width: 28, height: 28)
                            .rotationEffect(.degrees(-90))
                        Text("\(Int(scrollProgress * 100))%")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(Color(hex: "#1a6b6b"))
                    }
                    .padding(.trailing, 16)
                }
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .overlay(Divider().opacity(0.3), alignment: .bottom)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

// MARK: - WebView Representable
struct NagHammadi1WebView: UIViewRepresentable {
    @Binding var scrollProgress: Double
    @Binding var currentModule: String
    @Binding var quizPassed: Bool
    @Binding var quizScore: Int
    @Binding var showUnlockOverlay: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollProgress: $scrollProgress, currentModule: $currentModule,
                    quizPassed: $quizPassed, quizScore: $quizScore, showUnlockOverlay: $showUnlockOverlay)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.userContentController.add(context.coordinator, name: "aperture")
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = UIColor(hex: "#0a0704")
        context.coordinator.webView = webView

        if let url = Bundle.main.url(forResource: "nag-hammadi-course1", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            webView.loadHTMLString(content, baseURL: url)
        } else {
            let placeholder = "<html><body style='background:#0a0704;color:#2a9999;font-family:serif;text-align:center;padding-top:40vh'><h2>Add nag-hammadi-course1.html to your Xcode target</h2></body></html>"
            webView.loadHTMLString(placeholder, baseURL: nil)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        @Binding var scrollProgress: Double
        @Binding var currentModule: String
        @Binding var quizPassed: Bool
        @Binding var quizScore: Int
        @Binding var showUnlockOverlay: Bool
        var isLoaded = false
        weak var webView: WKWebView?

        init(scrollProgress: Binding<Double>, currentModule: Binding<String>,
             quizPassed: Binding<Bool>, quizScore: Binding<Int>, showUnlockOverlay: Binding<Bool>) {
            _scrollProgress = scrollProgress
            _currentModule = currentModule
            _quizPassed = quizPassed
            _quizScore = quizScore
            _showUnlockOverlay = showUnlockOverlay
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any] else { return }
            DispatchQueue.main.async {
                if let progress = body["scrollProgress"] as? Double {
                    self.scrollProgress = max(0, min(1, progress))
                }
                if let mod = body["module"] as? String {
                    self.currentModule = mod
                }
                if let type = body["type"] as? String {
                    if type == "quizResult" {
                        let score = body["score"] as? Int ?? 0
                        let passed = body["passed"] as? Bool ?? false
                        self.quizScore = score
                        self.quizPassed = passed
                        if passed {
                            UserDefaults.standard.set(true, forKey: "course_nag_hammadi_1_complete")
                            UserDefaults.standard.set(score, forKey: "course_nag_hammadi_1_score")
                        }
                    }
                    if type == "userDefaults", let key = body["key"] as? String {
                        if let val = body["value"] as? Bool { UserDefaults.standard.set(val, forKey: key) }
                        else if let val = body["value"] as? Int { UserDefaults.standard.set(val, forKey: key) }
                    }
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let js = """
            (function() {
                function reportScroll() {
                    var body = document.body, html = document.documentElement;
                    var total = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight) - window.innerHeight;
                    var progress = total > 0 ? window.scrollY / total : 0;
                    window.webkit.messageHandlers.aperture.postMessage({ scrollProgress: progress });
                }
                window.addEventListener('scroll', reportScroll, { passive: true });
                reportScroll();
                document.getElementById('hero').style.paddingTop = '80px';
            })();
            """
            webView.evaluateJavaScript(js)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.isLoaded = true
            }
        }
    }
}
