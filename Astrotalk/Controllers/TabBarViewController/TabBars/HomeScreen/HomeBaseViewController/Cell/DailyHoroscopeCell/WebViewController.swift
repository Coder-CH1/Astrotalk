//
//  WebViewController.swift
//  Astrotalk
//
//  Created by Mac on 09/05/2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var url: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadWebContent()
    }
    
    private func setupWebView() {
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
    
    private func loadWebContent() {
        guard let url = url else {
            print("url is nil")
            return
        }
        
        DispatchQueue.main.async {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}

