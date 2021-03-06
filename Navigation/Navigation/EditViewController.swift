//
//  EditViewController.swift
//  Navigation
//
//  Created by 유저 on 2021. 2. 9..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(controller: EditViewController, message: String)
    func didImageonOffDone(controller: EditViewController, isOn: BooleanLiteralType)
    func didImageZoomDone(controller: EditViewController, isZoom: BooleanLiteralType)
}

class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var isZoom = false
    var isOn = false
    var delegate: EditDelegate?
    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var swIsOn: UISwitch!
    @IBOutlet weak var btnResize: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
        
        if isZoom { // true
            btnResize.setTitle("축소", for: .normal)
        }
        else { // false
            btnResize.setTitle("확대", for: .normal)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        if isZoom { // true
            btnResize.setTitle("축소", for: .normal)
            isZoom = false
        }
        else { // false
            btnResize.setTitle("확대", for: .normal)
            isZoom = true
        }
    
    }
    
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func btnBarDone(_ sender: UIBarButtonItem) {
        if delegate != nil {
            delegate?.didMessageEditDone(controller: self, message: txtMessage.text!)
            delegate?.didImageonOffDone(controller: self, isOn: isOn)
            delegate?.didImageZoomDone(controller: self, isZoom: isZoom)
        }
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(controller: self, message: txtMessage.text!)
            delegate?.didImageonOffDone(controller: self, isOn: isOn)
            delegate?.didImageZoomDone(controller: self, isZoom: isZoom)
        }
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
