//
//  ViewController.swift
//  webapp
//
//  Created by 유저 on 2021. 2. 4..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var myActivityIndicatior: UIActivityIndicatorView!
    
    let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
    
    func loadWebPage(url: String){
        let myUrl = NSURL(string: url)
        let myRequest = NSURLRequest(url: myUrl as! URL)
        myWebView.loadRequest(myRequest as URLRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myWebView.delegate = self
        
        loadWebPage(url: filePath!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidStartLoad(_ webView: UIWebView) {
        myActivityIndicatior.stopAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivityIndicatior.stopAnimating()
        myActivityIndicatior.isHidden = true
    }
}

