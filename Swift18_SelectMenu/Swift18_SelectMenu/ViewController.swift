//
//  ViewController.swift
//  Swift18_SelectMenu
//
//  Created by Tran Duc Hieu on 7/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet var myPickerView: UIPickerView!
    @IBOutlet var lblFoodName: UILabel!

    var myArray:[String]!
    var foodName:[String]!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int)->Int {
        return myArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return myArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var img:UIImageView = UIImageView(frame: CGRectMake(0, 0, 120, 96))
        img.image = UIImage(named: myArray[row])
        return img
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblFoodName.text = foodName[row]
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg"]
        foodName = ["Súp vịt quay", "Cà ri cá", "Gà trộn gừng chua ngọt", "Cá hồi xiên que", "Xúc xích khìa nước dừa", "Cà bát om thịt ba chỉ"]
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

