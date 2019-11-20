//
//  AuthViewController.swift
//  Ikou
//
//  Created by Salgara on 11/20/19.
//  Copyright © 2019 Noa. All rights reserved.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController, AuthViewProtocol{
    
    // MARK: - UI Properties
    var titleLabel: UILabel!
    var webView: UIWebView!
    
    // MARK: - Protocol
    var presenter: AuthPresenterProtocol?
    
    override func viewDidLoad() {
        setUI()
        presenter?.getAuthURL()
        super.viewDidLoad()
    }
    
    func didLoadAuth(url: URL) {
        webView.loadRequest(URLRequest(url: url))
    }
    
}
extension AuthViewController{
    
    // MARK: - UI
    func setUI(){   
        setWebView()
    }
    
    func setWebView(){
        webView = UIWebView()
        webView.delegate = self
        self.view.addSubview(webView)
        webView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
extension AuthViewController: UIWebViewDelegate{
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        presenter?.retrieveSteamIdFrom(request.url?.absoluteString)
//
        return true
//        76561198876056556
    }
    
}
