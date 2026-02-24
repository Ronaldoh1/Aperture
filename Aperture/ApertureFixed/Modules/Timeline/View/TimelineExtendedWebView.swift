// TimelineExtendedWebView.swift
// Aperture — Timeline Module
//
// Wraps the HTML "Time Travel: Hidden History" extended experience
// in a WKWebView. Loaded from the app bundle.
//
// File to add to bundle: timeline_extended.html
// (Drag into Xcode → check "Copy if needed" → verify target membership ✓)

import SwiftUI
import WebKit

// MARK: - WebView Representable

struct TimelineExtendedWebViewRepresentable: UIViewRepresentable {
    
    @Binding var isLoading: Bool
    @Binding var hasError: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.backgroundColor = UIColor(red: 0.012, green: 0.012, blue: 0.059, alpha: 1) // #03030f
        webView.isOpaque = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.navigationDelegate = context.coordinator
        
        // Load from bundle
        if let url = Bundle.main.url(forResource: "timeline_extended", withExtension: "html") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        } else {
            // Fallback: show instructions
            let fallback = """
            <html><body style="background:#03030f;color:#FFD700;font-family:sans-serif;
            display:flex;align-items:center;justify-content:center;height:100vh;text-align:center;padding:40px;">
            <div>
                <div style="font-size:48px;margin-bottom:20px;">⧗</div>
                <h2>Add timeline_extended.html to your bundle</h2>
                <p style="opacity:0.6">Drag the HTML file into Xcode,<br>check "Copy if needed",<br>and verify target membership ✓</p>
            </div></body></html>
            """
            webView.loadHTMLString(fallback, baseURL: nil)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(isLoading: $isLoading, hasError: $hasError)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        @Binding var isLoading: Bool
        @Binding var hasError: Bool
        
        init(isLoading: Binding<Bool>, hasError: Binding<Bool>) {
            _isLoading = isLoading
            _hasError = hasError
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.async { self.isLoading = false }
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async { self.isLoading = false; self.hasError = true }
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            DispatchQueue.main.async { self.isLoading = false; self.hasError = true }
        }
    }
}

// MARK: - Host Screen

struct TimelineExtendedWebView: View {
    
    @State private var isLoading = true
    @State private var hasError = false
    
    var body: some View {
        ZStack {
            Color(hex: "#03030f").ignoresSafeArea()
            
            TimelineExtendedWebViewRepresentable(isLoading: $isLoading, hasError: $hasError)
                .ignoresSafeArea()
            
            // Loading
            if isLoading {
                loadingOverlay
            }
            
            // Error
            if hasError {
                errorOverlay
            }
        }
    }
    
    private var loadingOverlay: some View {
        ZStack {
            Color(hex: "#03030f").ignoresSafeArea()
            VStack(spacing: 20) {
                ChronoPulsingIcon()
                Text("ENTERING THE TIMELINE")
                    .font(.custom("Georgia", size: 11))
                    .tracking(5)
                    .foregroundColor(Palette.accent.gold)
            }
        }
        .transition(.opacity)
        .animation(.easeOut(duration: 0.6), value: isLoading)
    }
    
    private var errorOverlay: some View {
        ZStack {
            Color(hex: "#03030f").ignoresSafeArea()
            VStack(spacing: 16) {
                Text("⧗")
                    .font(.system(size: 48))
                Text("Signal Interrupted")
                    .font(.custom("Georgia", size: 20))
                    .foregroundColor(.white)
                Text("Make sure timeline_extended.html\nis added to your app bundle.")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
                Button("Retry") {
                    hasError = false
                    isLoading = true
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 12)
                .background(Palette.accent.gold)
                .foregroundColor(.black)
                .font(.system(size: 15, weight: .bold))
                .clipShape(Capsule())
                .padding(.top, 8)
            }
            .padding(32)
        }
    }
}

// MARK: - Pulsing Clock Icon (loading state)

private struct ChronoPulsingIcon: View {
    @State private var scale: CGFloat = 0.9
    
    var body: some View {
        Text("⧗")
            .font(.system(size: 52))
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true)) {
                    scale = 1.1
                }
            }
    }
}
