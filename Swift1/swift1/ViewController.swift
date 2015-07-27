//
//  ViewController.swift
//  swift1
//
//  Created by Tran Duc Hieu on 7/6/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblContent: UILabel!
    
    @IBAction func btnHello(sender: AnyObject) {
        lblContent.text = "Hello Swift"
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

