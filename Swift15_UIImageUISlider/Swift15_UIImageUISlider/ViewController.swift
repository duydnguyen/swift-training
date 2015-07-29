//
//  ViewController.swift
//  Swift15_UIImageUISlider
//
//  Created by Tran Duc Hieu on 7/28/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sldChon: UISlider!
    @IBOutlet var imgDog: UIImageView!
    
    var imgName:String!
    var imgIndex:Int!
    
    @IBAction func Slider_ValueChanged(sender: AnyObject) {
        var curValue:Float = sldChon.value
        imgIndex = Int(curValue)
        imgName = "dog" + String(imgIndex) + ".png"
        imgDog.image = UIImage(named: imgName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgIndex = 1
        imgName = "dog" + String(imgIndex) + ".png"
        imgDog.image = UIImage(named: imgName)
        sldChon.minimumValue = 1
        sldChon.maximumValue = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

