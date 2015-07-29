//
//  ViewController.swift
//  Swift16-Array
//
//  Created by Tran Duc Hieu on 7/28/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtView: UITextView!
    var array:[String]!
    
    @IBAction func CreateArray(sender: AnyObject) {
        array = ["AAA", "BBB","CCC","DDD"]
    }
    
    @IBAction func ShowArray(sender: AnyObject) {
//        txtView.text = "Phan tu thu nhat la:" + array[1]

/*        var sopt: Int = array.count
        txtView.text = "So phan tu la: " + String(sopt)*/

//      Duyet mang
        array.append("EEE")
        array.removeAtIndex(1)
        var s:String = ""
        for i in 0...array.count-1 {
            s = s + array[i] + "\n"
        }
        txtView.text = s
        
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

