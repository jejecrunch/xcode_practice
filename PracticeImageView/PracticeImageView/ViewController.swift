//
//  ViewController.swift
//  PracticeImageView
//
//  Created by 유저 on 2021. 1. 27..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var order = 0
    var img: UIImage?
    var imageName = ["01.png", "02.png", "03.png"]
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnPrev: UIButton!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        img=UIImage(named: imageName[order])
        
        imgView.image = img
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPrevImage(_ sender: UIButton) {
        if(order >= 0 && order <= 3) {
            order = order - 1;
        }
        
        img = UIImage(named: imageName[order])
        
        imgView.image = img
        
    }

    @IBAction func btnNextImage(_ sender: UIButton) {
        if(order >= 0 && order <= 3) {
            order = order + 1;
        }
        
        img = UIImage(named: imageName[order])
        
        imgView.image = img
    }
}

