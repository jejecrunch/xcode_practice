//
//  ViewController.swift
//  DrawFlower
//
//  Created by 유저 on 2021. 2. 10..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDrawFlower(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // 기둥 그리기
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 140, y: 200))
        context.addLine(to: CGPoint(x: 170, y: 450))
        context.addLine(to: CGPoint(x: 110, y: 450))
        context.fillPath()
        context.strokePath()
        
        // 원 그리기
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.addEllipse(in: CGRect(x: 90, y: 150, width: 100, height: 100))
        context.strokePath()
        
        
        context.addEllipse(in: CGRect(x: 90+50, y: 150, width: 100, height: 100))
        context.strokePath()
        
        
        context.addEllipse(in: CGRect(x: 90-50, y: 150, width: 100, height: 100))
        context.strokePath()
    
        
        context.addEllipse(in: CGRect(x: 90, y: 150-50, width: 100, height: 100))
        context.strokePath()
        
        context.addEllipse(in: CGRect(x: 90, y: 150+50, width: 100, height: 100))
        context.strokePath()
        
        
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        
    }

    @IBAction func btnReset(_ sender: UIButton) {
        imgView.image = nil
    }
}

