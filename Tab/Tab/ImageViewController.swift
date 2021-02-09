//
//  ViewController.swift
//  ImageView
//
//  Created by 유저 on 2021. 1. 27..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom=false;
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgOn=UIImage(named:"lamp_on.png")
        imgOff=UIImage(named:"lamp_off.png")
        
        imgView.image=imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom){ // true
            newWidth=imgView.frame.width/scale
            newHeight=imgView.frame.height/scale
            btnResize.setTitle("zoom in", for: .normal)
        }
        else { // false
            newWidth=imgView.frame.width*scale
            newHeight=imgView.frame.height*scale
            btnResize.setTitle("zoom out", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
        
    }

    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        } else {
            imgView.image=imgOff
        }
    }
}

