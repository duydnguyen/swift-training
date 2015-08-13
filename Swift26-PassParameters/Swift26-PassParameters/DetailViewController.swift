//
//  DetailViewController.swift
//  Swift26-PassParameters
//
//  Created by Tran Duc Hieu on 8/13/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var param:NSUserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        param = NSUserDefaults()
        var danhSach:[String] = ["1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png"]
        
        var strSelect:String = param.objectForKey("row") as! String
        
        var select:Int = Int(strSelect)!
        
        var backGround:UIImage = UIImage(named: danhSach[select])!
        
        self.view.backgroundColor = UIColor(patternImage: backGround)
        
        // Do any additional setup after loading the view.
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
