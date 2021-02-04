//
//  ViewController.swift
//  web
//
//  Created by 유저 on 2021. 2. 4..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    // 지정 웹 페이지 보여주기
    func loadWebPage(url: String) {
        let myUrl = NSURL(string: url)
        let myRequest = NSURLRequest(url: myUrl as! URL)
        myWebView.loadRequest(myRequest as URLRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.delegate = self
        loadWebPage(url: "http://dev-jejecrunch.tistory.com")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    // http:// 자동으로 삽입하는 코드
    func checkUrl(url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }

    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(url: txtUrl.text!)
        txtUrl.text! = " "
        loadWebPage(url: myUrl)
    }

    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage(url: "http://github.com/jejecrunch")
    }
    
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage(url: "http://plie.tistory.com")
    }
    
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1>HTML TEST</h1> <p>hello world!</p> <p>string 변수를 이용한 웹 페이지</p><a href=\"http://naver.com\">naver</a>로 이동</p>"
        
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        loadWebPage(url: filePath!)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}

