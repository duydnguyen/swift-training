//
//  NextViewController.swift
//  Swift19_NSUserDefault
//
//  Created by Tran Duc Hieu on 7/20/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    var thamSoTruyen:NSUserDefaults!
    
    @IBOutlet var lblContent: UILabel!
    
    @IBAction func btnClick(sender: AnyObject) {
        lblContent.text = thamSoTruyen.objectForKey("globalContent") as! NSString as String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        thamSoTruyen = NSUserDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
