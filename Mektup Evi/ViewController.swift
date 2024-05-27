//
//  ViewController.swift
//  Mektup Evi
//
//  Created by Ali Burak Pekışık on 6.09.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIScrollViewDelegate{
    
    let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        
        let source: String = "var meta = document.createElement('meta');" +
            "meta.name = 'viewport';" +
            "meta.content = 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
            "var head = document.getElementsByTagName('head')[0];" +
            "head.appendChild(meta);"

        let script: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let userContentController: WKUserContentController = WKUserContentController()
        configuration.userContentController = userContentController
        userContentController.addUserScript(script)
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)

        guard let url = URL(string: "https://www.mektupevi.com") else {
            return
        }
        webView.load(URLRequest(url: url))
        
        webView.scrollView.bounces = false
        webView.scrollView.isScrollEnabled = true
        webView.scrollView.showsVerticalScrollIndicator = false
        webView.scrollView.showsHorizontalScrollIndicator = false
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") {
                result, error in guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}
