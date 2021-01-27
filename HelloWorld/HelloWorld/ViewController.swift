//
//  ViewController.swift
//  HelloWorld
//
//  Created by 유저 on 2021. 1. 27..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnSend(_ sender: UIButton) {
        lblHello.text="Hello, "+txtName.text!
    }

}

