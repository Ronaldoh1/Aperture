import SwiftUI
import WebKit

// MARK: - Main View

struct UndoChainsView: View {
    @State private var scrollProgress: Double = 0
    @State private var currentModule: String = "Intro"
    @State private var showUnlockOverlay = false
    @State private var quizPassed = false
    @State private var quizScore = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            // WebView
            UndoChainsWebViewRepresentable(
                scrollProgress: $scrollProgress,
                currentModule: $currentModule,
                quizPassed: $quizPassed,
                quizScore: $quizScore,
                showUnlockOverlay: $showUnlockOverlay
            )
            .ignoresSafeArea()

            // Native header overlay
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "#c9a84c"))
                            .padding(.leading, 16)
                            .frame(width: 44, height: 44)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("UNDO THE CHAINS")
                            .font(.custom("Cinzel-Regular", size: 11))
                            .tracking(3)
                            .foregroundColor(Color(hex: "#c9a84c"))
                        Text(currentModule)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Color(hex: "#5a4838"))
                            .lineLimit(1)
                    }
                    Spacer()
                    // Completion indicator
                    ZStack {
                        Circle()
                            .stroke(Color(hex: "#3d0812").opacity(0.5), lineWidth: 1.5)
                            .frame(width: 28, height: 28)
                        Circle()
                            .trim(from: 0, to: scrollProgress)
                            .stroke(Color(hex: "#8b1a2a"), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            .frame(width: 28, height: 28)
                            .rotationEffect(.degrees(-90))
                        Text("\(Int(scrollProgress * 100))%")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(Color(hex: "#8b1a2a"))
                    }
                    .padding(.trailing, 16)
                    .frame(width: 44, height: 44)
                }
                .frame(height: 44)
                .background(
                    Color(hex: "#08030a").opacity(0.92)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: "#3d0812").opacity(0.6)),
                            alignment: .bottom
                        )
                )

                // Progress bar
                GeometryReader { geo in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [Color(hex: "#8b1a2a"), Color(hex: "#c9a84c")],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: geo.size.width * scrollProgress, height: 2)
                        .animation(.linear(duration: 0.1), value: scrollProgress)
                }
                .frame(height: 2)
            }

            // Unlock overlay
            if showUnlockOverlay {
                UndoChainsUnlockOverlay(score: quizScore) {
                    showUnlockOverlay = false
                }
                .transition(.opacity)
                .zIndex(100)
            }
        }
        .navigationBarHidden(true)
        .statusBar(hidden: false)
    }
}

// MARK: - WebView Representable

struct UndoChainsWebViewRepresentable: UIViewRepresentable {
    @Binding var scrollProgress: Double
    @Binding var currentModule: String
    @Binding var quizPassed: Bool
    @Binding var quizScore: Int
    @Binding var showUnlockOverlay: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "aperture")
        config.userContentController = contentController

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.delegate = context.coordinator
        webView.backgroundColor = UIColor(hex: "#08030a")
        webView.isOpaque = true

        loadContent(webView)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    private func loadContent(_ webView: WKWebView) {
        if let url = Bundle.main.url(forResource: "sunflow-undo-chains", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            webView.loadHTMLString(content, baseURL: nil)
            return
        }
        // Fallback placeholder
        let placeholder = """
        <!DOCTYPE html><html>
        <head><meta charset='UTF-8'><meta name='viewport' content='width=device-width,initial-scale=1'>
        <style>body{background:#08030a;color:#c9a84c;font-family:serif;display:flex;
        align-items:center;justify-content:center;height:100vh;margin:0;text-align:center}</style>
        </head><body>
        <div><p style='font-size:32px'>⛓️‍💥</p><p>Course loading...</p>
        <p style='font-size:13px;color:#5a4838;margin-top:8px'>
        Add sunflow-undo-chains.html to your Xcode target</p></div>
        </body></html>
        """
        webView.loadHTMLString(placeholder, baseURL: nil)
    }

    // MARK: - Coordinator

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {
        var parent: UndoChainsWebViewRepresentable
        weak var webView: WKWebView?

        init(_ parent: UndoChainsWebViewRepresentable) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.webView = webView
            injectScrollTracker(webView)
        }

        func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if action.navigationType == .linkActivated, let url = action.request.url,
               url.scheme == "https" || url.scheme == "http" {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }

        private func injectScrollTracker(_ webView: WKWebView) {
            let js = """
            window.addEventListener('scroll', function() {
                var scrolled = window.scrollY;
                var total = document.documentElement.scrollHeight - window.innerHeight;
                var progress = total > 0 ? scrolled / total : 0;

                // Module detection
                var modules = ['module-1','module-2','module-3','module-4','module-5','module-6',
                               'module-7','module-8','module-9','module-10','module-11','module-12'];
                var labels = ['The Inversion','Anatomical Truth','12 Disciples','Resurrection',
                              'Christ State','Control Mechanism','Hidden In Sight','Antichrist',
                              'All Traditions','Activation','Sovereignty','Building SunFlow'];
                var currentLabel = 'Introduction';
                modules.forEach(function(id, i) {
                    var el = document.getElementById(id);
                    if (el && el.getBoundingClientRect().top < window.innerHeight * 0.5) {
                        currentLabel = labels[i];
                    }
                });

                window.webkit.messageHandlers.aperture.postMessage({
                    type: 'scroll',
                    progress: progress,
                    module: currentLabel
                });
            }, { passive: true });
            """
            webView.evaluateJavaScript(js, completionHandler: nil)
        }

        func userContentController(_ userContentController: WKUserContentController,
                                    didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any],
                  let type = body["type"] as? String else { return }

            DispatchQueue.main.async {
                switch type {
                case "scroll":
                    if let progress = body["progress"] as? Double {
                        self.parent.scrollProgress = min(1.0, max(0, progress))
                    }
                    if let module = body["module"] as? String {
                        self.parent.currentModule = module
                    }
                case "quizResult":
                    if let score = body["score"] as? Int,
                       let passed = body["passed"] as? Bool {
                        self.parent.quizScore = score
                        self.parent.quizPassed = passed
                        if passed {
                            UserDefaults.standard.set(true, forKey: "course_undo_chains_complete")
                            UserDefaults.standard.set(score, forKey: "course_undo_chains_score")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                self.parent.showUnlockOverlay = true
                            }
                        }
                    }
                default:
                    break
                }
            }
        }
    }
}

// MARK: - Unlock Overlay

struct UndoChainsUnlockOverlay: View {
    let score: Int
    let onDismiss: () -> Void
    @State private var appear = false

    var body: some View {
        ZStack {
            Color.black.opacity(0.88).ignoresSafeArea()

            VStack(spacing: 0) {
                Text("⛓️‍💥")
                    .font(.system(size: 56))
                    .padding(.bottom, 20)
                    .scaleEffect(appear ? 1 : 0.5)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7), value: appear)

                Text("CHAINS UNDONE")
                    .font(.custom("Cinzel-Regular", size: 11))
                    .tracking(4)
                    .foregroundColor(Color(hex: "#8b1a2a"))
                    .padding(.bottom, 6)

                Text("Course III · Complete")
                    .font(.custom("CinzelDecorative-Regular", size: 20))
                    .foregroundColor(Color(hex: "#c9a84c"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 6)

                Text("\(score)/12 correct · Liberation confirmed")
                    .font(.custom("Cinzel-Regular", size: 11))
                    .foregroundColor(Color(hex: "#5a4838"))
                    .padding(.bottom, 28)

                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [.clear, Color(hex: "#8b1a2a").opacity(0.3), .clear],
                            startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 28)

                Text("THE KINGDOM IS WITHIN YOU")
                    .font(.custom("Cinzel-Regular", size: 11))
                    .tracking(2)
                    .foregroundColor(Color(hex: "#5a4838"))
                    .padding(.bottom, 8)

                Text("You have received what was\ndeliberately taken from you.")
                    .font(.custom("EBGaramond-Italic", size: 16))
                    .foregroundColor(Color(hex: "#a89878"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.bottom, 36)

                Button(action: onDismiss) {
                    Text("CONTINUE THE JOURNEY")
                        .font(.custom("Cinzel-Regular", size: 12))
                        .tracking(2)
                        .foregroundColor(Color(hex: "#08030a"))
                        .padding(.horizontal, 32)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(
                                colors: [Color(hex: "#c9a84c"), Color(hex: "#7a6030")],
                                startPoint: .leading, endPoint: .trailing
                            )
                        )
                        .clipShape(Capsule())
                }
            }
            .padding(40)
            .opacity(appear ? 1 : 0)
            .offset(y: appear ? 0 : 30)
            .animation(.easeOut(duration: 0.6), value: appear)
        }
        .onAppear { appear = true }
    }
}

// MARK: - UIColor hex extension (if not already defined)
extension UIColor {
    convenience init(hex: String) {
        let h = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: h).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch h.count {
        case 3: (a,r,g,b) = (255,(int>>8)*17,(int>>4&0xF)*17,(int&0xF)*17)
        case 6: (a,r,g,b) = (255,int>>16,int>>8&0xFF,int&0xFF)
        case 8: (a,r,g,b) = (int>>24,int>>16&0xFF,int>>8&0xFF,int&0xFF)
        default:(a,r,g,b) = (255,0,0,0)
        }
        self.init(red:Double(r)/255,green:Double(g)/255,blue:Double(b)/255,alpha:Double(a)/255)
    }
}
