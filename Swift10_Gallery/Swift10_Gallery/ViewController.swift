//
//  ViewController.swift
//  Swift10_Gallery
//
//  Created by Tran Duc Hieu on 7/26/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgHinh: UIImageView!
    
    var timer:NSTimer!
    var indexHinh:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        indexHinh = 1
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("ChangeImage"), userInfo: nil, repeats: true)
    }

    func ChangeImage() {
        var imgSrc:String = String(indexHinh) + ".png"
        imgHinh.image = UIImage(named: imgSrc)
        indexHinh = (indexHinh % 9) + 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

