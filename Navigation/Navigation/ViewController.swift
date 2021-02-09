//
//  ViewController.swift
//  Navigation
//
//  Created by 유저 on 2021. 2. 9..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {

    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true
    var isZoom = false
    
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgView.image = imgOn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            // 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Button"
        } else if segue.identifier == "editBarButton" {
            // 바 버튼을 클릭한 경우
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.isZoom = self.isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(controller: EditViewController, message: String) {
        txtMessage.text = message
    }
    
    func didImageonOffDone(controller: EditViewController, isOn: BooleanLiteralType) {
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        } else {
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didImageZoomDone(controller: EditViewController, isZoom: BooleanLiteralType) {

        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if (self.isZoom) { // true
            newWidth=imgView.frame.width/scale
            newHeight=imgView.frame.height/scale
        }
        else { // false
            newWidth=imgView.frame.width*scale
            newHeight=imgView.frame.height*scale
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        self.isZoom = !(self.isZoom)

    }
}

