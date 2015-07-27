//
//  ViewController.swift
//  Swift3
//
//  Created by Tran Duc Hieu on 7/6/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var so1:Int!
    var so2:Int!
    var dau:String!
    
    @IBOutlet weak var txtKetQua: UITextField!
    
    @IBAction func btn7(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "7"
        txtKetQua.text = kq
    }
    
    @IBAction func btn8(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "8"
        txtKetQua.text = kq
    }
    
    @IBAction func btn9(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "9"
        txtKetQua.text = kq
    }
    
    @IBAction func btnPlus(sender: AnyObject) {
        // Assign value for so1
        var s1:String = txtKetQua.text
        so1 = s1.toInt()
        txtKetQua.text = ""
        
        // Save operator
        dau = "+"
    }
    
    @IBAction func btn4(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "4"
        txtKetQua.text = kq
    }
    
    @IBAction func btn5(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "5"
        txtKetQua.text = kq
    }
    
    @IBAction func btn6(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "6"
        txtKetQua.text = kq
    }
    
    @IBAction func btnMinus(sender: AnyObject) {
        // Assign value for so1
        var s1:String = txtKetQua.text
        so1 = s1.toInt()
        txtKetQua.text = ""
        
        // Save operator
        dau = "-"
    }
    
    @IBAction func btn1(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "1"
        txtKetQua.text = kq
    }
    
    @IBAction func btn2(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "2"
        txtKetQua.text = kq
    }
    
    @IBAction func btn3(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "3"
        txtKetQua.text = kq
    }
    
    @IBAction func btnMultiple(sender: AnyObject) {
        // Assign value for so1
        var s1:String = txtKetQua.text
        so1 = s1.toInt()
        txtKetQua.text = ""
        
        // Save operator
        dau = "*"
    }
    
    @IBAction func btnC(sender: AnyObject) {
        txtKetQua.text = ""
    }
    
    @IBAction func btn0(sender: AnyObject) {
        var kq:String = txtKetQua.text
        kq += "0"
        txtKetQua.text = kq
    }
    
    @IBAction func btnEqual(sender: AnyObject) {
        //Assign value for so2
        var s2:String = txtKetQua.text
        so2 = s2.toInt()
        
        var kq:Int = 0
        var notDivision:Bool = true
        
        switch dau {
            case "+": kq = so1 + so2
            case "-": kq = so1 - so2
            case "*": kq = so1 * so2
        default: notDivision = false
        }
        
        if notDivision {
            txtKetQua.text = String(kq)
        } else {
            if so2 != 0 {
                var divResult:Float = Float(so1) / Float(so2)
                txtKetQua.text = divResult.description
            } else {
                txtKetQua.text = "Divide by Zero"
            }
        }
    }
    
    @IBAction func btnDivide(sender: AnyObject) {
        // Assign value for so1
        var s1:String = txtKetQua.text
        so1 = s1.toInt()
        txtKetQua.text = ""
        
        // Save operator
        dau = "/"
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