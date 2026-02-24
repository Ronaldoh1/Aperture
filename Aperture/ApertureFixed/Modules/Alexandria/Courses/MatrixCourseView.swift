import SwiftUI
import WebKit

// MARK: - Exposing the Matrix Course
// Entry point: No prerequisite. Always unlocked.
// Completion key: "course_matrix_complete"

struct MatrixCourseView: View {
    @State private var scrollProgress: Double = 0
    @State private var currentModule: String = "BOOT"
    @State private var quizPassed = false
    @State private var quizScore = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            MatrixWebView(scrollProgress: $scrollProgress, currentModule: $currentModule,
                          quizPassed: $quizPassed, quizScore: $quizScore)
                .ignoresSafeArea()

            // Header overlay
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "#3ae890"))
                            .padding(.leading, 16)
                            .frame(width: 44, height: 44)
                    }
                    Spacer()
                    VStack(spacing: 2) {
                        Text("REALITY DECODED")
                            .font(.custom("ShareTechMono-Regular", size: 10).bold())
                            .tracking(3)
                            .foregroundColor(Color(hex: "#3ae890"))
                        Text(currentModule)
                            .font(.custom("ShareTechMono-Regular", size: 9))
                            .foregroundColor(Color(hex: "#2a4830"))
                            .lineLimit(1)
                    }
                    Spacer()
                    ZStack {
                        Circle()
                            .stroke(Color(hex: "#0a2a18").opacity(0.5), lineWidth: 1.5)
                            .frame(width: 28, height: 28)
                        Circle()
                            .trim(from: 0, to: scrollProgress)
                            .stroke(Color(hex: "#3ae890"), style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                            .frame(width: 28, height: 28)
                            .rotationEffect(.degrees(-90))
                        Text("\(Int(scrollProgress * 100))%")
                            .font(.system(size: 7, weight: .bold))
                            .foregroundColor(Color(hex: "#3ae890"))
                    }
                    .padding(.trailing, 16)
                }
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .overlay(Divider().opacity(0.2), alignment: .bottom)
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct MatrixWebView: UIViewRepresentable {
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
        webView.backgroundColor = UIColor(hex: "#020604")

        if let url = Bundle.main.url(forResource: "aperture-matrix-course", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            webView.loadHTMLString(content, baseURL: url)
        } else {
            let ph = "<html><body style='background:#020604;color:#3ae890;font-family:monospace;text-align:center;padding-top:40vh'><h2>Add aperture-matrix-course.html to Xcode target</h2></body></html>"
            webView.loadHTMLString(ph, baseURL: nil)
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
            _scrollProgress = scrollProgress; _currentModule = currentModule
            _quizPassed = quizPassed; _quizScore = quizScore
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any] else { return }
            DispatchQueue.main.async {
                if let p = body["scrollProgress"] as? Double { self.scrollProgress = max(0, min(1, p)) }
                if let type = body["type"] as? String {
                    if type == "quizResult" {
                        let s = body["score"] as? Int ?? 0
                        let p = body["passed"] as? Bool ?? false
                        self.quizScore = s; self.quizPassed = p
                        if p {
                            UserDefaults.standard.set(true, forKey: "course_matrix_complete")
                            UserDefaults.standard.set(s, forKey: "course_matrix_score")
                            // Register with Aperture's ProgressTracker system
                            let tracker = ProgressTracker.shared
                            let courseId = "exposing_matrix_html"
                            let courseName = "Exposing the Matrix"
                            if !tracker.courseProgress.contains(where: { $0.courseId == courseId }) {
                                tracker.startCourse(courseId: courseId, courseName: courseName, totalLessons: 1)
                            }
                            tracker.recordLessonComplete(courseId: courseId, lessonId: "matrix_final_exam")
                        }
                    }
                    if type == "userDefaults", let key = body["key"] as? String {
                        if let v = body["value"] as? Bool { UserDefaults.standard.set(v, forKey: key) }
                        else if let v = body["value"] as? Int { UserDefaults.standard.set(v, forKey: key) }
                    }
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let js = """
            (function(){
                function rp(){var b=document.body,h=document.documentElement,t=Math.max(b.scrollHeight,b.offsetHeight,h.clientHeight,h.scrollHeight,h.offsetHeight)-window.innerHeight;var p=t>0?window.scrollY/t:0;window.webkit.messageHandlers.aperture.postMessage({scrollProgress:p});}
                window.addEventListener('scroll',rp,{passive:true});rp();
                document.getElementById('hero').style.paddingTop='70px';
            })();
            """
            webView.evaluateJavaScript(js)
        }
    }
}
