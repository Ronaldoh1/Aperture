import SwiftUI
import WebKit

// MARK: - Nag Hammadi Course II
// Requires: "course_nag_hammadi_1_complete" == true
// Completion key: "course_nag_hammadi_2_complete"

struct NagHammadi2View: View {
    @State private var scrollProgress: Double = 0
    @State private var currentModule: String = "Gnostic Theology"
    @State private var quizPassed = false
    @State private var quizScore = 0
    @Environment(\.presentationMode) var presentationMode

    private let isUnlocked = UserDefaults.standard.bool(forKey: "course_nag_hammadi_1_complete")

    var body: some View {
        ZStack(alignment: .top) {
            if isUnlocked {
                NagHammadi2WebView(
                    scrollProgress: $scrollProgress,
                    currentModule: $currentModule,
                    quizPassed: $quizPassed,
                    quizScore: $quizScore
                )
                .ignoresSafeArea()
            } else {
                // Lock screen
                ZStack {
                    Color(hex: "#06040e").ignoresSafeArea()
                    VStack(spacing: 20) {
                        Text("🔒")
                            .font(.system(size: 48))
                        Text("COMPLETE COURSE I FIRST")
                            .font(.custom("Cinzel-Regular", size: 13))
                            .tracking(3)
                            .foregroundColor(Color(hex: "#7030b8"))
                        Text("The Nag Hammadi Library: Foundations\nmust precede the theology.")
                            .font(.custom("EBGaramond-Italic", size: 16))
                            .foregroundColor(Color(hex: "#9880b8"))
                            .multilineTextAlignment(.center)
                            .lineSpacing(4)
                    }
                    .padding(40)
                }
            }

            // Header
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "#9050e0"))
                            .padding(.leading, 16)
                            .frame(width: 44, height: 44)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("THE HIDDEN GOSPEL · COURSE II")
                            .font(.custom("Cinzel-Regular", size: 10))
                            .tracking(3)
                            .foregroundColor(Color(hex: "#9050e0"))
                        Text(currentModule)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Color(hex: "#483860"))
                            .lineLimit(1)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color(hex: "#1a1040").opacity(0.5), lineWidth: 1.5)
                            .frame(width: 28, height: 28)
                        Circle()
                            .trim(from: 0, to: scrollProgress)
                            .stroke(Color(hex: "#7030b8"), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            .frame(width: 28, height: 28)
                            .rotationEffect(.degrees(-90))
                        Text("\(Int(scrollProgress * 100))%")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(Color(hex: "#9050e0"))
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

// MARK: - WebView
struct NagHammadi2WebView: UIViewRepresentable {
    @Binding var scrollProgress: Double
    @Binding var currentModule: String
    @Binding var quizPassed: Bool
    @Binding var quizScore: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollProgress: $scrollProgress, currentModule: $currentModule,
                    quizPassed: $quizPassed, quizScore: $quizScore)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.userContentController.add(context.coordinator, name: "aperture")
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = UIColor(hex: "#06040e")

        if let url = Bundle.main.url(forResource: "nag-hammadi-course2", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            webView.loadHTMLString(content, baseURL: url)
        } else {
            let placeholder = "<html><body style='background:#06040e;color:#9050e0;font-family:serif;text-align:center;padding-top:40vh'><h2>Add nag-hammadi-course2.html to your Xcode target</h2></body></html>"
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

        init(scrollProgress: Binding<Double>, currentModule: Binding<String>,
             quizPassed: Binding<Bool>, quizScore: Binding<Int>) {
            _scrollProgress = scrollProgress
            _currentModule = currentModule
            _quizPassed = quizPassed
            _quizScore = quizScore
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any] else { return }
            DispatchQueue.main.async {
                if let progress = body["scrollProgress"] as? Double {
                    self.scrollProgress = max(0, min(1, progress))
                }
                if let type = body["type"] as? String {
                    if type == "quizResult" {
                        let score = body["score"] as? Int ?? 0
                        let passed = body["passed"] as? Bool ?? false
                        self.quizScore = score
                        self.quizPassed = passed
                        if passed {
                            UserDefaults.standard.set(true, forKey: "course_nag_hammadi_2_complete")
                            UserDefaults.standard.set(true, forKey: "course_nag_hammadi_series_complete")
                            UserDefaults.standard.set(score, forKey: "course_nag_hammadi_2_score")
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
        }
    }
}
