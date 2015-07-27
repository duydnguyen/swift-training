//
//  ViewController.swift
//  Swift8
//
//  Created by Tran Duc Hieu on 7/9/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDog: UIImageView!
    
    var timer:NSTimer!
    var imgNumber:Int!
    
    @IBAction func StartMoving(sender: AnyObject) {
                timer = NSTimer.scheduledTimerWithTimeInterval(0.24, target: self, selector: Selector("GoGoGo"), userInfo: nil, repeats: true)
    }
    
    func GoGoGo () {
        var imgName: String = "dog" + String(imgNumber) + ".png"
        imgDog.image = UIImage(named: imgName)
        imgNumber = imgNumber % 8 + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgNumber = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

