// FrequencyMasterclassView.swift
// Loads the Frequency Mastery Masterclass HTML course in WKWebView.
// ⚠️ LOCKED until UserDefaults key "course_vortex369_complete" == true
// ☀️ SunFlow: Reignited — Alexandria Library · Level II

import SwiftUI
import WebKit

// MARK: - Main View

struct FrequencyMasterclassView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var scrollProgress: Double = 0
    @State private var isLoaded = false
    @State private var currentModule = 0
    @State private var showModuleLabel = false
    @State private var moduleLabelText = ""

    private let isUnlocked = UserDefaults.standard.bool(forKey: "course_vortex369_complete")

    private let moduleLabels = [
        "Introduction", "Prerequisites", "Curriculum",
        "Module I · Foundations",
        "Module II · 3-6-9 Deep Dive",
        "Module III · Solfeggio",
        "Module IV · Cymatics",
        "Module V · Water",
        "Module VI · DNA Antenna",
        "Module VII · Tuning Wars",
        "Module VIII · Mastery Integration",
        "Living Frequency Codex"
    ]

    var body: some View {
        if isUnlocked {
            courseContent
        } else {
            lockedView
        }
    }

    // MARK: - Course Content (Unlocked)

    private var courseContent: some View {
        ZStack(alignment: .top) {

            MasterclassWebViewRepresentable(
                scrollProgress: $scrollProgress,
                currentModule: $currentModule,
                isLoaded: $isLoaded
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                nativeHeader
                Spacer()
            }

            if showModuleLabel {
                VStack {
                    Spacer()
                    Text(moduleLabelText)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(hex: "#d4870a").opacity(0.9))
                        .padding(.horizontal, 18).padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }

            if !isLoaded { loadingView }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .onChange(of: currentModule) { _, newVal in
            guard newVal < moduleLabels.count else { return }
            moduleLabelText = moduleLabels[newVal]
            withAnimation(.easeOut(duration: 0.3)) { showModuleLabel = true }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                withAnimation(.easeIn(duration: 0.3)) { showModuleLabel = false }
            }
        }
    }

    // MARK: - Locked View

    private var lockedView: some View {
        ZStack {
            Color(hex: "#040608").ignoresSafeArea()
            // Subtle starfield suggestion
            ForEach(0..<40, id: \.self) { i in
                Circle()
                    .fill(Color(hex: "#c9a84c").opacity(Double.random(in: 0.05...0.2)))
                    .frame(width: CGFloat.random(in: 1...2.5), height: CGFloat.random(in: 1...2.5))
                    .position(x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                              y: CGFloat.random(in: 0...UIScreen.main.bounds.height))
            }
            VStack(spacing: 28) {
                // Lock icon with glow
                ZStack {
                    Circle()
                        .fill(RadialGradient(
                            colors: [Color(hex: "#7a6030").opacity(0.3), Color.clear],
                            center: .center, startRadius: 0, endRadius: 60
                        ))
                        .frame(width: 120, height: 120)
                    Image(systemName: "lock.fill")
                        .font(.system(size: 42, weight: .light))
                        .foregroundColor(Color(hex: "#7a6030"))
                }
                VStack(spacing: 10) {
                    Text("LOCKED")
                        .font(.custom("Cinzel-Regular", size: 11).bold())
                        .kerning(4)
                        .foregroundColor(Color(hex: "#7a6030"))
                    Text("Frequency Mastery\nMasterclass")
                        .font(.custom("Cinzel-Regular", size: 22))
                        .kerning(0.5)
                        .foregroundColor(Color(hex: "#c9a84c").opacity(0.5))
                        .multilineTextAlignment(.center)
                }
                HStack(spacing: 12) {
                    Rectangle().fill(Color(hex: "#c9a84c").opacity(0.15)).frame(height: 1)
                    Text("◈").foregroundColor(Color(hex: "#7a6030")).font(.system(size: 10))
                    Rectangle().fill(Color(hex: "#c9a84c").opacity(0.15)).frame(height: 1)
                }
                .padding(.horizontal, 40)
                Text("Complete\n\"The Key to the Universe\"\nCourse I to unlock this Masterclass.")
                    .font(.system(size: 15, weight: .regular, design: .serif))
                    .foregroundColor(Color(hex: "#5a5040"))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                Button {
                    dismiss()
                } label: {
                    Text("Back")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(Color(hex: "#7a6030"))
                        .padding(.horizontal, 28).padding(.vertical, 10)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color(hex: "#7a6030").opacity(0.4)))
                }
                .buttonStyle(.plain)
                .padding(.top, 8)
            }
            .padding(.horizontal, 40)
        }
        .navigationBarHidden(true)
    }

    // MARK: - Native Header

    private var nativeHeader: some View {
        ZStack {
            Rectangle().fill(.ultraThinMaterial).frame(height: headerHeight)
            LinearGradient(
                colors: [Color(hex: "#040608").opacity(0.94), Color(hex: "#07090f").opacity(0.7)],
                startPoint: .top, endPoint: .bottom
            ).frame(height: headerHeight)

            VStack {
                Spacer()
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle().fill(Color(hex: "#6a4020").opacity(0.3)).frame(height: 1.5)
                        Rectangle()
                            .fill(LinearGradient(
                                colors: [Color(hex: "#d4870a"), Color(hex: "#c9a84c")],
                                startPoint: .leading, endPoint: .trailing))
                            .frame(width: geo.size.width * scrollProgress, height: 1.5)
                            .animation(.linear(duration: 0.1), value: scrollProgress)
                    }
                }.frame(height: 1.5)
            }.frame(height: headerHeight)

            HStack(spacing: 0) {
                Button { dismiss() } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left").font(.system(size: 15, weight: .semibold))
                        Text("Alexandria").font(.system(size: 15))
                    }
                    .foregroundColor(Color(hex: "#d4870a"))
                    .padding(.leading, 18).padding(.top, topPadding)
                }
                Spacer()
                VStack(spacing: 2) {
                    Text("☉ SunFlow: Reignited")
                        .font(.custom("Cinzel-Regular", size: 9).bold())
                        .kerning(2.5).foregroundColor(Color(hex: "#6a4020"))
                        .padding(.top, topPadding)
                    Text("Masterclass")
                        .font(.custom("Cinzel-Regular", size: 13))
                        .kerning(1.5).foregroundColor(Color(hex: "#d4870a"))
                }
                Spacer()
                Text("\(Int(scrollProgress * 100))%")
                    .font(.system(size: 12, weight: .bold, design: .monospaced))
                    .foregroundColor(Color(hex: "#d4870a").opacity(0.75))
                    .padding(.top, topPadding).padding(.trailing, 18)
            }
        }
        .frame(height: headerHeight).ignoresSafeArea(edges: .top)
    }

    // MARK: - Loading View

    private var loadingView: some View {
        ZStack {
            Color(hex: "#040608").ignoresSafeArea()
            VStack(spacing: 24) {
                ZStack {
                    ForEach([0.8, 0.5, 0.25], id: \.self) { opacity in
                        Circle()
                            .stroke(Color(hex: "#d4870a").opacity(opacity), lineWidth: 1)
                            .frame(width: 80, height: 80)
                    }
                    Text("✦")
                        .font(.system(size: 22))
                        .foregroundColor(Color(hex: "#d4870a"))
                }
                .modifier(MasterclassPulse())
                Text("Tuning the Frequency...")
                    .font(.custom("Cinzel-Regular", size: 13))
                    .kerning(2).foregroundColor(Color(hex: "#6a4020"))
            }
        }.transition(.opacity)
    }

    private var topPadding: CGFloat {
        let w = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first?.windows.first
        return (w?.safeAreaInsets.top ?? 44) * 0.4
    }
    private var headerHeight: CGFloat {
        let w = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }.first?.windows.first
        return (w?.safeAreaInsets.top ?? 44) + 52
    }
}

// MARK: - Pulse Modifier

private struct MasterclassPulse: ViewModifier {
    @State private var scale: CGFloat = 1.0
    func body(content: Content) -> some View {
        content.scaleEffect(scale).onAppear {
            withAnimation(.easeInOut(duration: 1.4).repeatForever(autoreverses: true)) { scale = 1.1 }
        }
    }
}

// MARK: - WKWebView Representable

struct MasterclassWebViewRepresentable: UIViewRepresentable {

    @Binding var scrollProgress: Double
    @Binding var currentModule: Int
    @Binding var isLoaded: Bool

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollProgress: $scrollProgress, currentModule: $currentModule, isLoaded: $isLoaded)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.userContentController.add(context.coordinator, name: "aperture")
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 4/255, green: 6/255, blue: 8/255, alpha: 1)
        webView.scrollView.backgroundColor = UIColor(red: 4/255, green: 6/255, blue: 8/255, alpha: 1)
        webView.navigationDelegate = context.coordinator
        context.coordinator.webView = webView
        webView.loadHTMLString(MasterclassHTMLContent.html, baseURL: nil)
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        @Binding var scrollProgress: Double
        @Binding var currentModule: Int
        @Binding var isLoaded: Bool
        weak var webView: WKWebView?

        init(scrollProgress: Binding<Double>, currentModule: Binding<Int>, isLoaded: Binding<Bool>) {
            _scrollProgress = scrollProgress
            _currentModule = currentModule
            _isLoaded = isLoaded
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            guard let body = message.body as? [String: Any] else { return }
            DispatchQueue.main.async {
                if let progress = body["scrollProgress"] as? Double {
                    self.scrollProgress = max(0, min(1, progress))
                }
                if let module = body["module"] as? Int {
                    self.currentModule = module
                }
                if let type = body["type"] as? String, type == "quizResult" {
                    let score = body["score"] as? Int ?? 0
                    let passed = body["passed"] as? Bool ?? false
                    if passed {
                        UserDefaults.standard.set(true, forKey: "course_masterclass_complete")
                        UserDefaults.standard.set(score, forKey: "course_masterclass_score")
                    }
                }
                if let type = body["type"] as? String, type == "userDefaults",
                   let key = body["key"] as? String {
                    if let val = body["value"] as? Bool { UserDefaults.standard.set(val, forKey: key) }
                    else if let val = body["value"] as? Int { UserDefaults.standard.set(val, forKey: key) }
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
                var moduleIds = ['hero','prereqs','modules-overview','module-1','module-2','module-3','module-4','module-5','module-6','module-7','module-8','completion'];
                moduleIds.forEach(function(id, idx) {
                    var el = document.getElementById(id);
                    if (!el) return;
                    var obs = new IntersectionObserver(function(entries) {
                        entries.forEach(function(e) {
                            if (e.isIntersecting) window.webkit.messageHandlers.aperture.postMessage({ module: idx });
                        });
                    }, { threshold: 0.3 });
                    obs.observe(el);
                });
                window.addEventListener('scroll', reportScroll, { passive: true });
                reportScroll();
            })();
            """
            webView.evaluateJavaScript(js)
            let paddingJS = """
            document.getElementById('hero').style.paddingTop = '80px';
            """
            webView.evaluateJavaScript(paddingJS)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.6)) { self.isLoaded = true }
            }
        }
    }
}

// MARK: - Embedded Masterclass HTML Content


// MARK: - Embedded Masterclass HTML Content
// Loads from bundle resource — avoids Swift multi-line string indentation issues

enum MasterclassHTMLContent {
    static var html: String {
        // Try loading from app bundle first (cleanest approach)
        if let url = Bundle.main.url(forResource: "sunflow-masterclass", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            return content
        }
        // Fallback: minimal placeholder
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <style>
        body { background: #040608; color: #c9a84c; font-family: serif;
               display: flex; align-items: center; justify-content: center;
               height: 100vh; margin: 0; text-align: center; }
        </style>
        </head>
        <body>
        <div>
          <p style="font-size:32px">☉</p>
          <p>Masterclass loading...</p>
          <p style="font-size:13px;color:#5a5040;margin-top:8px">
            Ensure sunflow-masterclass.html is added to your Xcode target
          </p>
        </div>
        </body>
        </html>
        """
    }
}
