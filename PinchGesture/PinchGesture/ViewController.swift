//
//  ViewController.swift
//  PinchGesture
//
//  Created by 유저 on 2021. 2. 10..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imgPinch: UIImageView!
    
    var initialFontSize: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }

}

