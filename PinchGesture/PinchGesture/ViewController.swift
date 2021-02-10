//
//  ViewController.swift
//  PinchGesture
//
//  Created by 유저 on 2021. 2. 10..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPinch: UILabel!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    func doPinch(_ pinch: UIPinchGestureRecognizer) {
        if (pinch.state == UIGestureRecognizerState.began) {
            initialFontSize = txtPinch.font.pointSize
        } else {
            txtPinch.font = txtPinch.font.withSize(initialFontSize*pinch.scale)
        }
    }

}

