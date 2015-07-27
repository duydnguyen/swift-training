//
//  ViewController.swift
//  Swift5
//
//  Created by Tran Duc Hieu on 7/7/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Generate(sender: AnyObject) {
        for i in 0...100 {
            var x:Int = Int(arc4random()) % 375
            var y:Int = Int(arc4random()) % 667
            var snowFlake:UIImageView = UIImageView(frame:CGRectMake(CGFloat(x), CGFloat(y), 16, 16))
            snowFlake.image = UIImage(named: "Snowflake2.png")
            self.view.addSubview(snowFlake)
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

