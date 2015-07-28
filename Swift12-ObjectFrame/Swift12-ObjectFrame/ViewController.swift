//
//  ViewController.swift
//  Swift12-ObjectFrame
//
//  Created by Tran Duc Hieu on 7/27/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgConKhi: UIImageView!
    
    @IBAction func MoveUp(sender: AnyObject) {
        imgConKhi.frame.origin.y -= 2
        imgConKhi.frame.size.width -= 2
    }
    
    @IBAction func MoveDown(sender: AnyObject) {
        imgConKhi.frame.origin.y += 2
        imgConKhi.frame.size.width += 2
    }
    
    @IBAction func MoveLeft(sender: AnyObject) {
        imgConKhi.frame.origin.x -= 2
        imgConKhi.frame.size.height -= 2
    }
    
    @IBAction func MoveRight(sender: AnyObject) {
        imgConKhi.frame.origin.x += 2
        imgConKhi.frame.size.height += 2
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

