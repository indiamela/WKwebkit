//
//  ViewController.swift
//  WKwebkit
//
//  Created by 楠瀬大志 on 2020/10/14.
//

import UIKit
import WebKit  //webviewを通してwebを使うことができる

class ViewController: UIViewController, WKNavigationDelegate {
    //プロトコル：画面の読み込み・遷移
    var webview = WKWebView()

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    

    @IBOutlet weak var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 実体になっている
        
        // 大きさ
        webview.frame = CGRect(x: 0, y: toolbar.frame.size.height, width: view.frame.size.width, height: view.frame.size.height - toolbar.frame.size.height*2)
        view.addSubview(webview)
        
        //何をロードするのか
        webview.navigationDelegate = self
        let url = URL(string: "https://www.yahoo.co.jp/") //Stringをurl型にキャスト
        let request = URLRequest(url: url!) //アンラップ
        webview.load(request) //urlをロードする
        
        //ロードが開始された時
        func webView(_ webview: WKWebView,didCommitnavigation: WKNavigation!){
            
            print ("読み込み開始")
            indicator.startAnimating()
        }
        
        
        //ロードが完了した時
        func webView(_ webview: WKWebView,didFinishnavigation: WKNavigation!){
            
            print ("ロード完了")
            indicator.stopAnimating()
        }
        
        
    }

    @IBAction func go(_ sender: Any) {
        webview.goForward()
    }
    
    @IBAction func back(_ sender: Any) {
        webview.goBack()
    }
}

