//
//  ViewController.swift
//  Swift20-
//
//  Created by Tran Duc Hieu on 8/3/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtHovaTen: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtSodt: UITextField!
    @IBOutlet var txtDiaChi: UITextField!
    @IBOutlet var sldTuoi: UISlider!

    var transferParam:NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        transferParam = NSUserDefaults()
        sldTuoi.minimumValue = 1
        sldTuoi.maximumValue = 100
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        transferParam.setObject(txtHovaTen.text, forKey: "hoten")
        transferParam.setObject(txtEmail.text, forKey: "email")
        transferParam.setObject(txtSodt.text, forKey: "sodt")
        transferParam.setObject(txtDiaChi.text, forKey: "diachi")
        transferParam.setObject(String(Int(sldTuoi.value)), forKey: "tuoi")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

