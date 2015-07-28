//
//  ViewController.swift
//  Swift14-UISlider
//
//  Created by Tran Duc Hieu on 7/27/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sldChon: UISlider!

    @IBOutlet var lblGiaTri: UILabel!
    
    @IBAction func SldChanging(sender: AnyObject) {
        var value:Float = sldChon.value
        lblGiaTri.text = String(Int(value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sldChon.minimumValue = 0
        sldChon.maximumValue = 100
        lblGiaTri.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

