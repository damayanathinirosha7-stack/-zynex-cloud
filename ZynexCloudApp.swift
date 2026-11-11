import SwiftUI
import WebKit

@main
struct ZynexCloudApp: App {
    var body: some Scene {
        WindowGroup {
            ZynexWebView()
                .ignoresSafeArea()
                .preferredColorScheme(.dark)
        }
    }
}

struct ZynexWebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: configuration)
        view.isOpaque = false
        view.backgroundColor = UIColor(red: 12/255, green: 18/255, blue: 32/255, alpha: 1)
        view.scrollView.isScrollEnabled = false
        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            view.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return view
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
