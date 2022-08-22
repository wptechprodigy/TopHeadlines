//
//  HeadlineDetailsViewController.swift
//  TopHeadlines
//
//  Created by waheedCodes on 21/08/2022.
//

import UIKit
import WebKit

class HeadlineDetailsViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!

    private let url: URL

    init?(coder: NSCoder, url: URL) {
        self.url = url
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadHeadlineDetails()
    }

    private func loadHeadlineDetails() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
