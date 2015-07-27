//
//  ViewController.swift
//  Swift11-Avatar
//
//  Created by Tran Duc Hieu on 7/26/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtID: UITextField!
    @IBOutlet var imgHinh: UIImageView!
    
    @IBAction func btnGetAvatar(sender: AnyObject) {
        var url:NSURL = NSURL(string: "http://graph.facebook.com/" + txtID.text + "/picture?=type=large")!
        var data:NSData = NSData(contentsOfURL: url)!
        imgHinh.image = UIImage(data: data)
    }
    
    @IBAction func btnGetYahooAvatar(sender: AnyObject) {
        var url:NSURL = NSURL(string: "http://img.msg.yahoo.com/v1/displayImage/yahoo/" + txtID.text)!
        var data:NSData = NSData(contentsOfURL: url)!
        imgHinh.image = UIImage(data: data)
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

