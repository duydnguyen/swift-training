//
//  ViewController.swift
//  NSTimer
//
//  Created by Tran Duc Hieu on 7/12/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgRobot: UIImageView!
    
    @IBAction func btnGo(sender: AnyObject) {

        UIView.animateWithDuration(5, animations: {
            self.imgRobot.frame.origin.x = self.view.frame.size.width
            self.imgRobot.frame.origin.y = self.view.frame.origin.y+300
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var timer:NSTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("ThayDo"), userInfo: nil, repeats: true)
    }
    
    var so:Int = 1
    
    func ThayDo() {
        imgRobot.image = UIImage(named: "Run (\(so)).png")
        so = so % 8 + 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

