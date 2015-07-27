//
//  ViewController.swift
//  Swift9-UIImage
//
//  Created by Tran Duc Hieu on 7/26/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgHinh: UIImageView!
    
    @IBAction func btnLoadLocal(sender: AnyObject) {
        imgHinh.image = UIImage(named: "monkey.png")
    }
    
    @IBAction func btnLoadGlobal(sender: AnyObject) {
        var url:NSURL = NSURL(string: "http://www.clipartbest.com/cliparts/Kij/xnK/KijxnKayT.png")!
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

