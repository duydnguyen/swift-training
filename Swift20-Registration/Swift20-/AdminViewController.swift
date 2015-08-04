//
//  AdminViewController.swift
//  Swift20-Registration
//
//  Created by Tran Duc Hieu on 8/3/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    @IBOutlet var txtView: UITextView!

    var transferParam:NSUserDefaults!
    override func viewDidLoad() {
        super.viewDidLoad()
        transferParam = NSUserDefaults()
        
        var hoten:String = transferParam.objectForKey("hoten") as NSString
        var email:String = transferParam.objectForKey("email") as NSString
        var sodt:String = transferParam.objectForKey("sodt") as NSString
        var diachi:String = transferParam.objectForKey("diachi") as NSString
        var tuoi:String = transferParam.objectForKey("tuoi") as NSString
        
        var content:String = ""
        content = "Bạn vừa đăng kí với thông tin như sau: \nHọ và tên: " + hoten + "\nEmail: " + email + "\nĐịa chỉ: " + diachi + "\nSố điện thoại: " + sodt + "\nTuổi: " + tuoi
        
        txtView.text = content
        
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
