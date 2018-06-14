//
//  ViewController.swift
//  HyoBrowser
//
//  Created by Hyowon Choi on 2018. 5. 1..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.request(url: "http://www.naver.com")
    }
    
    @IBAction func back() {
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func forward() {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }

    func request(url: String) {
        self.webView.load(URLRequest(url: URL(string: url)!))
        self.webView.navigationDelegate = self
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.request(url: searchBar.text!)
        self.view.endEditing(true)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.searchBar.text = webView.url?.absoluteString
    }
}
