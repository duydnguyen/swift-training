//
//  ViewController.swift
//  Swift4
//
//  Created by Tran Duc Hieu on 7/7/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtDiemThi: UITextField!
    @IBOutlet weak var lblKetQua: UILabel!
    
    @IBAction func btnKiemTra(sender: AnyObject) {
        var strDiemThi:String = txtDiemThi.text
        var intDiemThi:Int = strDiemThi.toInt()!
        
        if intDiemThi >= 5 {
            lblKetQua.text = "Passed!"
        } else {
            lblKetQua.text = "Failed!"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

