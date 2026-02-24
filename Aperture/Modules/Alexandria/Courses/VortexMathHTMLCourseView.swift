// VortexMathHTMLCourseView.swift
// Loads the full "Key to the Universe" interactive HTML course in a WKWebView
// inside the Aperture app with a native cosmic header and progress tracking.
// ☀️ SunFlow: Reignited — Alexandria Library
//
// INTEGRATION: Call VortexMathHTMLCourseView() from any NavigationStack or .sheet
// e.g. in AlexandriaCourseView or anywhere a course card is tapped.

import SwiftUI
import WebKit

// MARK: - Main View

struct VortexMathHTMLCourseView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var scrollProgress: Double = 0
    @State private var isLoaded = false
    @State private var currentModule = 0
    @State private var showModuleLabel = false
    @State private var moduleLabelText = ""
    // Quiz + Unlock
    @State private var quizPassed = false
    @State private var quizScore = 0
    @State private var showUnlockCelebration = false

    // Module titles synced to the HTML nav dots
    private let moduleLabels = [
        "Introduction", "Curriculum",
        "Module 1 · Foundations",
        "Module 2 · Vortex Mathematics",
        "Module 3 · Solfeggio Frequencies",
        "Module 4 · Language & Gematria",
        "Module 5 · Cosmic Structure",
        "Module 6 · DNA & Water",
        "Module 7 · Tuning Wars",
        "Module 8 · Integration"
    ]

    var body: some View {
        ZStack(alignment: .top) {

            // ── WebView ──
            VortexWebViewRepresentable(
                scrollProgress: $scrollProgress,
                currentModule: $currentModule,
                isLoaded: $isLoaded,
                quizPassed: $quizPassed,
                quizScore: $quizScore
            )
            .ignoresSafeArea()

            // ── Native Header Overlay ──
            VStack(spacing: 0) {
                nativeHeader
                Spacer()
            }

            // ── Module Label Toast ──
            if showModuleLabel {
                VStack {
                    Spacer()
                    Text(moduleLabelText)
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(Color(hex: "#c9a84c").opacity(0.9))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Capsule())
                        .padding(.bottom, 40)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }

            // ── Loading Overlay ──
            if !isLoaded {
                loadingView
            }

            // ── Unlock Celebration Overlay ──
            if showUnlockCelebration {
                unlockCelebrationView
            }
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
        .onChange(of: quizPassed) { _, passed in
            guard passed else { return }
            // Persist completion
            UserDefaults.standard.set(true, forKey: "course_vortex369_complete")
            UserDefaults.standard.set(quizScore, forKey: "course_vortex369_score")
            // Show celebration
            withAnimation(.spring(response: 0.5, dampingFraction: 0.75)) {
                showUnlockCelebration = true
            }
        }
    }

    // MARK: - Native Header

    private var nativeHeader: some View {
        ZStack {
            // Frosted blur base
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: headerHeight)

            // Gold gradient tint
            LinearGradient(
                colors: [
                    Color(hex: "#060810").opacity(0.92),
                    Color(hex: "#0a0e1a").opacity(0.7)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: headerHeight)

            // Bottom progress bar
            VStack {
                Spacer()
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color(hex: "#7a6030").opacity(0.3))
                            .frame(height: 1.5)
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    colors: [Color(hex: "#f0d080"), Color(hex: "#c9a84c")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * scrollProgress, height: 1.5)
                            .animation(.linear(duration: 0.1), value: scrollProgress)
                    }
                }
                .frame(height: 1.5)
            }
            .frame(height: headerHeight)

            // Content row
            HStack(spacing: 0) {
                // Back button
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 15, weight: .semibold))
                        Text("Alexandria")
                            .font(.system(size: 15))
                    }
                    .foregroundColor(Color(hex: "#c9a84c"))
                    .padding(.leading, 18)
                    .padding(.top, topPadding)
                }

                Spacer()

                // Course title
                VStack(spacing: 2) {
                    Text("☉ SunFlow: Reignited")
                        .font(.custom("Cinzel-Regular", size: 9).bold())
                        .kerning(2.5)
                        .foregroundColor(Color(hex: "#7a6030"))
                        .padding(.top, topPadding)
                    Text("Course I")
                        .font(.custom("Cinzel-Regular", size: 13))
                        .kerning(1.5)
                        .foregroundColor(Color(hex: "#c9a84c"))
                }

                Spacer()

                // Progress indicator
                HStack(spacing: 5) {
                    Text("\(Int(scrollProgress * 100))%")
                        .font(.system(size: 12, weight: .bold, design: .monospaced))
                        .foregroundColor(Color(hex: "#c9a84c").opacity(0.75))
                        .padding(.top, topPadding)
                        .padding(.trailing, 18)
                }
            }
        }
        .frame(height: headerHeight)
        .ignoresSafeArea(edges: .top)
    }

    // MARK: - Unlock Celebration

    private var unlockCelebrationView: some View {
        ZStack {
            Color.black.opacity(0.85).ignoresSafeArea()
            VStack(spacing: 28) {
                // Animated golden seal
                ZStack {
                    ForEach([1.4, 1.2, 1.0], id: \.self) { scale in
                        Circle()
                            .stroke(
                                LinearGradient(colors: [Color(hex: "#f0d080"), Color(hex: "#7a6030")],
                                               startPoint: .top, endPoint: .bottom),
                                lineWidth: 1
                            )
                            .frame(width: 100, height: 100)
                            .scaleEffect(scale)
                            .opacity(1.0 / scale)
                    }
                    Text("☉")
                        .font(.system(size: 44))
                }
                .modifier(PulseModifier())

                VStack(spacing: 10) {
                    Text("FREQUENCY INITIATED")
                        .font(.custom("Cinzel-Regular", size: 12).bold())
                        .kerning(3)
                        .foregroundColor(Color(hex: "#7a6030"))
                    Text("Course I Complete")
                        .font(.custom("Cinzel-Regular", size: 26))
                        .kerning(1)
                        .foregroundColor(Color(hex: "#f0d080"))
                    Text("\(quizScore)/10 correct")
                        .font(.system(size: 14, weight: .medium, design: .monospaced))
                        .foregroundColor(Color(hex: "#c9a84c").opacity(0.7))
                }

                // Divider
                HStack(spacing: 12) {
                    Rectangle().fill(Color(hex: "#c9a84c").opacity(0.3)).frame(height: 1)
                    Text("✦").foregroundColor(Color(hex: "#c9a84c").opacity(0.6)).font(.system(size: 10))
                    Rectangle().fill(Color(hex: "#c9a84c").opacity(0.3)).frame(height: 1)
                }
                .padding(.horizontal, 40)

                VStack(spacing: 6) {
                    Text("UNLOCKED")
                        .font(.custom("Cinzel-Regular", size: 10).bold())
                        .kerning(3)
                        .foregroundColor(Color(hex: "#7a6030"))
                    Text("Frequency Mastery Masterclass")
                        .font(.custom("Cinzel-Regular", size: 18))
                        .kerning(0.5)
                        .foregroundColor(Color(hex: "#c9a84c"))
                        .multilineTextAlignment(.center)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 28)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "#c9a84c").opacity(0.08))
                        .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(hex: "#c9a84c").opacity(0.25), lineWidth: 1))
                )

                Button {
                    withAnimation(.easeIn(duration: 0.3)) { showUnlockCelebration = false }
                } label: {
                    Text("Continue")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(hex: "#060810"))
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(
                            LinearGradient(colors: [Color(hex: "#f0d080"), Color(hex: "#c9a84c")],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal, 32)
        }
        .transition(.opacity.combined(with: .scale(scale: 0.95)))
    }

    // MARK: - Loading View

    private var loadingView: some View {
        ZStack {
            Color(hex: "#060810").ignoresSafeArea()
            VStack(spacing: 24) {
                // Pulsing 369 symbol
                ZStack {
                    ForEach([0.8, 0.5, 0.25], id: \.self) { opacity in
                        Circle()
                            .stroke(Color(hex: "#c9a84c").opacity(opacity), lineWidth: 1)
                            .frame(width: 80, height: 80)
                    }
                    Text("3·6·9")
                        .font(.custom("Cinzel-Regular", size: 18).bold())
                        .kerning(4)
                        .foregroundColor(Color(hex: "#c9a84c"))
                }
                .modifier(PulseModifier())

                Text("Activating the Frequency...")
                    .font(.custom("Cinzel-Regular", size: 13))
                    .kerning(2)
                    .foregroundColor(Color(hex: "#7a6030"))
            }
        }
        .transition(.opacity)
    }

    // MARK: - Helpers

    private var topPadding: CGFloat {
        let window = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first
        return (window?.safeAreaInsets.top ?? 44) * 0.4
    }

    private var headerHeight: CGFloat {
        let window = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?.windows.first
        return (window?.safeAreaInsets.top ?? 44) + 52
    }
}

// MARK: - Pulse Modifier

private struct PulseModifier: ViewModifier {
    @State private var scale: CGFloat = 1.0
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                    scale = 1.1
                }
            }
    }
}

// MARK: - WKWebView Representable

struct VortexWebViewRepresentable: UIViewRepresentable {

    @Binding var scrollProgress: Double
    @Binding var currentModule: Int
    @Binding var isLoaded: Bool
    @Binding var quizPassed: Bool
    @Binding var quizScore: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(scrollProgress: $scrollProgress, currentModule: $currentModule,
                    isLoaded: $isLoaded, quizPassed: $quizPassed, quizScore: $quizScore)
    }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()

        // Allow inline media (for the canvas animations)
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        // Message handler for scroll + module events from JS
        config.userContentController.add(context.coordinator, name: "aperture")

        let webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = context.coordinator
        webView.scrollView.delegate = context.coordinator
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = false
        webView.backgroundColor = UIColor(Color(hex: "#060810"))
        webView.scrollView.backgroundColor = UIColor(Color(hex: "#060810"))

        // Inject JS scroll tracker after page loads
        context.coordinator.webView = webView

        // Load the embedded HTML
        webView.loadHTMLString(VortexMathHTMLContent.html, baseURL: nil)
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    // MARK: - Coordinator

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler, UIScrollViewDelegate {

        @Binding var scrollProgress: Double
        @Binding var currentModule: Int
        @Binding var isLoaded: Bool
        @Binding var quizPassed: Bool
        @Binding var quizScore: Int
        weak var webView: WKWebView?

        init(scrollProgress: Binding<Double>, currentModule: Binding<Int>, isLoaded: Binding<Bool>,
             quizPassed: Binding<Bool>, quizScore: Binding<Int>) {
            _scrollProgress = scrollProgress
            _currentModule = currentModule
            _isLoaded = isLoaded
            _quizPassed = quizPassed
            _quizScore = quizScore
        }

        // Called when JS sends window.webkit.messageHandlers.aperture.postMessage(...)
        func userContentController(
            _ userContentController: WKUserContentController,
            didReceive message: WKScriptMessage
        ) {
            guard let body = message.body as? [String: Any] else { return }
            DispatchQueue.main.async {
                if let progress = body["scrollProgress"] as? Double {
                    self.scrollProgress = max(0, min(1, progress))
                }
                if let module = body["module"] as? Int {
                    self.currentModule = module
                }
                // Quiz result
                if let type = body["type"] as? String, type == "quizResult" {
                    if let score = body["score"] as? Int { self.quizScore = score }
                    if let passed = body["passed"] as? Bool { self.quizPassed = passed }
                }
                if let type = body["type"] as? String, type == "injectQuiz" {
                    self.webView?.evaluateJavaScript(VortexQuizInjector.js)
                }
            }
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            // Inject scroll + module tracking JS
            let js = """
            (function() {
                function reportScroll() {
                    var body = document.body;
                    var html = document.documentElement;
                    var total = Math.max(
                        body.scrollHeight, body.offsetHeight,
                        html.clientHeight, html.scrollHeight, html.offsetHeight
                    ) - window.innerHeight;
                    var progress = total > 0 ? window.scrollY / total : 0;
                    window.webkit.messageHandlers.aperture.postMessage({
                        scrollProgress: progress
                    });
                }

                // Module detection via IntersectionObserver
                var moduleIds = [
                    'hero','modules-overview',
                    'module-1','module-2','module-3','module-4',
                    'module-5','module-6','module-7','module-8'
                ];
                var currentModule = 0;
                moduleIds.forEach(function(id, idx) {
                    var el = document.getElementById(id);
                    if (!el) return;
                    var obs = new IntersectionObserver(function(entries) {
                        entries.forEach(function(e) {
                            if (e.isIntersecting) {
                                window.webkit.messageHandlers.aperture.postMessage({
                                    module: idx
                                });
                            }
                        });
                    }, { threshold: 0.3 });
                    obs.observe(el);
                });

                window.addEventListener('scroll', reportScroll, { passive: true });
                reportScroll();
            })();
            """
            webView.evaluateJavaScript(js)

            // Add top padding so content clears the native header
            let paddingJS = """
            document.getElementById('hero').style.paddingTop =
                (document.getElementById('hero').style.paddingTop
                    ? parseInt(document.getElementById('hero').style.paddingTop) + 60
                    : 60) + 'px';
            """
            webView.evaluateJavaScript(paddingJS)

            // Inject quiz at end of course
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                webView.evaluateJavaScript(VortexQuizInjector.js)
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.6)) {
                    self.isLoaded = true
                }
            }
        }
    }
}

// MARK: - Quiz Injector

enum VortexQuizInjector {
    static let js: String = """
    (function() {
        if (document.getElementById('course-quiz')) return;
        var css = `
            #course-quiz {
                max-width: 800px; margin: 60px auto 80px; padding: 0 24px;
                font-family: 'EB Garamond', serif; opacity: 0;
                transform: translateY(30px); transition: opacity 0.8s ease, transform 0.8s ease;
            }
            #course-quiz.quiz-visible { opacity: 1; transform: translateY(0); }
            .quiz-header { text-align: center; margin-bottom: 48px; }
            .quiz-badge {
                display: inline-block; font-size: 10px; letter-spacing: 3px;
                color: #7a6030; margin-bottom: 12px; font-family: 'Cinzel', serif;
            }
            .quiz-title {
                font-size: clamp(22px,4vw,32px); color: #f0d080; margin-bottom: 8px;
                font-family: 'Cinzel Decorative', cursive;
            }
            .quiz-subtitle { font-size: 16px; color: #8a7e68; font-style: italic; }
            .quiz-divider {
                display: flex; align-items: center; gap: 12px; margin: 32px 0;
                color: #c9a84c; opacity: 0.4;
            }
            .quiz-divider::before, .quiz-divider::after {
                content: ''; flex: 1; height: 1px; background: #c9a84c;
            }
            .question-block {
                background: rgba(201,168,76,0.04); border: 1px solid rgba(201,168,76,0.15);
                border-radius: 12px; padding: 24px; margin-bottom: 20px;
            }
            .question-number {
                font-size: 11px; letter-spacing: 2px; color: #7a6030;
                font-family: 'Cinzel', serif; margin-bottom: 10px;
            }
            .question-text { font-size: 17px; color: #e8dfc8; margin-bottom: 18px; line-height: 1.5; }
            .options-grid { display: flex; flex-direction: column; gap: 10px; }
            .quiz-option {
                display: flex; align-items: flex-start; gap: 12px; padding: 12px 16px;
                background: rgba(255,255,255,0.03); border: 1px solid rgba(201,168,76,0.12);
                border-radius: 8px; cursor: pointer; transition: all 0.2s ease; color: #b8a888;
                font-size: 15px;
            }
            .quiz-option:hover { background: rgba(201,168,76,0.08); border-color: rgba(201,168,76,0.3); color: #e8dfc8; }
            .quiz-option.selected { background: rgba(201,168,76,0.12); border-color: rgba(201,168,76,0.5); color: #f0d080; }
            .quiz-option.correct { background: rgba(76,201,120,0.12) !important; border-color: rgba(76,201,120,0.5) !important; color: #7fdb9a !important; }
            .quiz-option.wrong { background: rgba(201,76,76,0.12) !important; border-color: rgba(201,76,76,0.4) !important; color: #db7f7f !important; }
            .option-letter {
                width: 22px; min-width: 22px; height: 22px; border-radius: 50%;
                background: rgba(201,168,76,0.15); display: flex; align-items: center;
                justify-content: center; font-size: 11px; font-family: 'Cinzel', serif;
                color: #c9a84c; margin-top: 1px;
            }
            .quiz-submit-btn {
                display: block; width: 100%; margin: 36px 0 16px; padding: 16px;
                background: linear-gradient(135deg, #c9a84c, #7a6030);
                border: none; border-radius: 8px; color: #060810; font-size: 15px;
                font-family: 'Cinzel', serif; letter-spacing: 2px; cursor: pointer;
                transition: opacity 0.2s ease; font-weight: bold;
            }
            .quiz-submit-btn:hover { opacity: 0.85; }
            .quiz-result {
                text-align: center; padding: 32px; border-radius: 12px; margin-top: 24px;
                display: none;
            }
            .quiz-result.show { display: block; }
            .result-score { font-size: 48px; color: #f0d080; font-family: 'Cinzel Decorative', cursive; margin-bottom: 8px; }
            .result-label { font-size: 13px; letter-spacing: 3px; font-family: 'Cinzel', serif; margin-bottom: 16px; }
            .result-message { font-size: 17px; color: #e8dfc8; font-style: italic; line-height: 1.6; }
            .result-pass { background: rgba(201,168,76,0.06); border: 1px solid rgba(201,168,76,0.2); }
            .result-fail { background: rgba(201,76,76,0.06); border: 1px solid rgba(201,76,76,0.2); }
            .retry-btn {
                display: inline-block; margin-top: 20px; padding: 12px 32px;
                border: 1px solid rgba(201,168,76,0.4); border-radius: 6px;
                color: #c9a84c; font-family: 'Cinzel', serif; font-size: 12px;
                letter-spacing: 2px; cursor: pointer; background: transparent;
            }
        `;
        var style = document.createElement('style');
        style.textContent = css;
        document.head.appendChild(style);

        var questions = [
            { q: "What makes 3, 6, and 9 the 'keys to the universe' in Vortex Mathematics?", options: ["They are lucky numbers", "They never appear in the doubling sequence (1,2,4,8,7,5) and always reduce to themselves or 9", "They form the Fibonacci sequence", "They correspond to primary colors"], answer: 1 },
            { q: "The Solfeggio frequency known as the 'Love Frequency' — associated with DNA repair and transformation — is:", options: ["396 Hz (liberation from fear)", "417 Hz (facilitating change)", "528 Hz (transformation / DNA)", "963 Hz (oneness)"], answer: 2 },
            { q: "In Pythagorean gematria, the word 'LOVE' reduces to which digital root?", options: ["3", "6", "9", "12"], answer: 2 },
            { q: "A toroid (the fundamental shape of the universe) is best described as:", options: ["A flat circular disc spinning in place", "A donut-shaped vortex field that folds energy back through itself", "A tetrahedron rotating in 3D space", "A crystalline hexagonal lattice"], answer: 1 },
            { q: "The Earth's natural electromagnetic heartbeat (Schumann Resonance) pulses at approximately:", options: ["3.6 Hz", "5.2 Hz", "7.83 Hz", "14.1 Hz"], answer: 2 },
            { q: "In Rodin's Vortex, which numbers are called the 'non-physical operators' that control all doubling sequences?", options: ["1, 2, 4", "5, 7, 8", "3, 6, 9", "2, 4, 8"], answer: 2 },
            { q: "Cymatics proves that:", options: ["Sound has no measurable effect on physical matter", "Sound organizes matter into precise sacred geometric patterns", "Light frequencies are more powerful than sound", "Only liquid matter responds to vibration"], answer: 1 },
            { q: "A=440 Hz became the international tuning standard (ISO) in:", options: ["1939", "1945", "1955", "1969"], answer: 2 },
            { q: "DNA functions as a biological:", options: ["Simple chemical blueprint with no energetic properties", "Quantum antenna that receives photons and phonons — light and sound", "Standard electrical conductor like copper", "Mechanical gear system controlling protein folding"], answer: 1 },
            { q: "The Solfeggio frequency 963 Hz — the highest in the original scale — is associated with:", options: ["Liberation from guilt and fear", "Facilitating radical change", "Intuition and expression", "Oneness and reconnection with Source"], answer: 3 }
        ];

        var correctAnswers = questions.map(function(q) { return q.answer; });
        var selected = new Array(questions.length).fill(-1);
        var submitted = false;

        var html = '<section id="course-quiz"><div class="quiz-header">';
        html += '<div class="quiz-badge">MODULE COMPLETION</div>';
        html += '<h2 class="quiz-title">Test Your Knowledge</h2>';
        html += '<p class="quiz-subtitle">Answer 7 or more correctly to complete the course and unlock the Masterclass</p>';
        html += '</div><div class="quiz-divider">✦</div>';

        questions.forEach(function(q, i) {
            html += '<div class="question-block" id="q-block-' + i + '">';
            html += '<div class="question-number">QUESTION ' + (i + 1) + ' OF ' + questions.length + '</div>';
            html += '<div class="question-text">' + q.q + '</div>';
            html += '<div class="options-grid">';
            var letters = ['A', 'B', 'C', 'D'];
            q.options.forEach(function(opt, j) {
                html += '<div class="quiz-option" data-q="' + i + '" data-a="' + j + '">';
                html += '<span class="option-letter">' + letters[j] + '</span>';
                html += '<span>' + opt + '</span></div>';
            });
            html += '</div></div>';
        });

        html += '<button class="quiz-submit-btn" id="quiz-submit">SUBMIT ANSWERS</button>';
        html += '<div class="quiz-result" id="quiz-result"></div>';
        html += '</section>';

        document.body.insertAdjacentHTML('beforeend', html);

        // Option selection
        document.querySelectorAll('.quiz-option').forEach(function(opt) {
            opt.addEventListener('click', function() {
                if (submitted) return;
                var q = parseInt(this.dataset.q);
                var a = parseInt(this.dataset.a);
                document.querySelectorAll('[data-q="' + q + '"]').forEach(function(o) { o.classList.remove('selected'); });
                this.classList.add('selected');
                selected[q] = a;
            });
        });

        // Submit
        document.getElementById('quiz-submit').addEventListener('click', function() {
            if (submitted) return;
            var answered = selected.filter(function(s) { return s !== -1; }).length;
            if (answered < questions.length) {
                alert('Please answer all ' + questions.length + ' questions before submitting.');
                return;
            }
            submitted = true;
            this.disabled = true;

            var score = 0;
            selected.forEach(function(ans, i) { if (ans === correctAnswers[i]) score++; });
            var passed = score >= 7;

            // Show correct/wrong
            document.querySelectorAll('.quiz-option').forEach(function(opt) {
                var q = parseInt(opt.dataset.q);
                var a = parseInt(opt.dataset.a);
                if (a === correctAnswers[q]) { opt.classList.add('correct'); }
                else if (a === selected[q] && a !== correctAnswers[q]) { opt.classList.add('wrong'); }
            });

            // Result panel
            var result = document.getElementById('quiz-result');
            result.className = 'quiz-result show ' + (passed ? 'result-pass' : 'result-fail');
            if (passed) {
                result.innerHTML = '<div class="result-score">' + score + '/10</div>' +
                    '<div class="result-label" style="color:#c9a84c">FREQUENCY INITIATED · COURSE I COMPLETE</div>' +
                    '<p class="result-message">You have integrated the language of creation. The Masterclass is now unlocked. Go deeper — the universe is waiting to speak through you.</p>';
            } else {
                result.innerHTML = '<div class="result-score" style="color:#db7f7f">' + score + '/10</div>' +
                    '<div class="result-label" style="color:#db7f7f">REVIEW AND RETRY</div>' +
                    '<p class="result-message">You got ' + score + ' of 10 correct. Review the highlighted answers above, then scroll back through the modules and try again.</p>' +
                    '<button class="retry-btn" id="quiz-retry">RETRY QUIZ</button>';
                document.getElementById('quiz-retry').addEventListener('click', function() {
                    document.getElementById('course-quiz').remove();
                    submitted = false;
                    window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.aperture &&
                        window.webkit.messageHandlers.aperture.postMessage({ type: 'quizRetry' });
                    // Re-inject
                    setTimeout(function() {
                        window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.aperture &&
                            window.webkit.messageHandlers.aperture.postMessage({ type: 'injectQuiz' });
                    }, 300);
                });
            }

            // Send result to Swift
            window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.aperture &&
                window.webkit.messageHandlers.aperture.postMessage({ type: 'quizResult', score: score, total: 10, passed: passed });
        });

        // Reveal on scroll
        var quizSection = document.getElementById('course-quiz');
        var observer = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) quizSection.classList.add('quiz-visible');
            });
        }, { threshold: 0.05 });
        observer.observe(quizSection);
    })();
    """
}

// MARK: - Embedded HTML Content


// MARK: - Embedded HTML Content
// Loads from bundle resource to avoid Swift multi-line string indentation issues

enum VortexMathHTMLContent {
    static var html: String {
        if let url = Bundle.main.url(forResource: "sunflow-course-1", withExtension: "html"),
           let content = try? String(contentsOf: url, encoding: .utf8) {
            return content
        }
        // Fallback placeholder
        return """
        <!DOCTYPE html>
        <html>
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <style>
        body { background: #060810; color: #c9a84c; font-family: serif;
               display: flex; align-items: center; justify-content: center;
               height: 100vh; margin: 0; text-align: center; }
        </style>
        </head>
        <body>
        <div>
          <p style="font-size:32px">3·6·9</p>
          <p>Course loading...</p>
          <p style="font-size:13px;color:#5a5040;margin-top:8px">
            Ensure sunflow-course-1.html is added to your Xcode target
          </p>
        </div>
        </body>
        </html>
        """
    }
}
