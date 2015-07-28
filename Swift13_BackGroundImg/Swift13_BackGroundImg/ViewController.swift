//
//  ViewController.swift
//  Swift13_BackGroundImg
//
//  Created by Tran Duc Hieu on 7/27/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var swtBackGround: UISwitch!
    
    @IBAction func swtChangeBkGround(sender: AnyObject) {
        if swtBackGround.on {
            var bkGround: UIImage = UIImage(named: "1.png")!
            self.view.backgroundColor = UIColor(patternImage: bkGround)
        }
        else {
            var bkGround: UIImage = UIImage(named: "2.png")!
            self.view.backgroundColor = UIColor(patternImage: bkGround)
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

