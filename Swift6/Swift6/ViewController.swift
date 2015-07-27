//
//  ViewController.swift
//  Swift6
//
//  Created by Tran Duc Hieu on 7/8/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblNumber: UILabel!
    
    var timer:NSTimer!
    
    @IBAction func btnStart(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("Count"), userInfo: nil, repeats: true)
    }
    
    @IBAction func btnStop(sender: AnyObject) {
         timer.invalidate()
    }
    
    func Count() {
        var n:Int! = lblNumber.text?.toInt()
        n = n + 1
        lblNumber.text = String(n)
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

