//
//  ViewController.swift
//  Swift19_NSUserDefault
//
//  Created by Tran Duc Hieu on 7/20/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var thamSoTruyen:NSUserDefaults!
    
    @IBOutlet var txtContent: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        thamSoTruyen = NSUserDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        thamSoTruyen.setObject(txtContent.text, forKey: "globalContent")
    }

}

