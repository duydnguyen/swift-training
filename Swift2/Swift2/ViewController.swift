//
//  ViewController.swift
//  Swift2
//
//  Created by Tran Duc Hieu on 7/6/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtHoTen: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtSDT: UITextField!

    @IBOutlet weak var txtView: UITextView!
    
    @IBAction func btnDangKi(sender: AnyObject) {
        var hoten:String! = txtHoTen.text
        var email:String! = txtEmail.text
        var sdt:String! = txtSDT.text
        var kq:String! = "Ban vua dang ki voi thong tin nhu sau: Ho va Ten: " + hoten + "Email: " + email + "So dien thoai:" + sdt
        txtView.text = kq
    }
    
    @IBAction func btnXoa(sender: AnyObject) {
        txtHoTen.text = ""
        txtEmail.text = ""
        txtSDT.text = ""
        txtView.text = ""
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

