//
//  ViewController.swift
//  Swift17-DanhBaiCao
//
//  Created by Tran Duc Hieu on 7/29/15.
//  Copyright (c) 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    
    var bobai:[String]!
    var player = Player()
    
    @IBAction func btnRutBai(sender: AnyObject) {
        
        // Random ra la thu 1
        var numberOfCard:Int = bobai.count
        var ranIndex:Int = Int(arc4random()) % numberOfCard
        img1.image = UIImage(named: bobai[ranIndex])
        bobai.removeAtIndex(ranIndex)
        
        // Random ra la thu 2
        numberOfCard = bobai.count
        ranIndex = Int(arc4random()) % numberOfCard
        img2.image = UIImage(named: bobai[ranIndex])
        bobai.removeAtIndex(ranIndex)

        // Random ra la thu 3
        numberOfCard = bobai.count
        ranIndex = Int(arc4random()) % numberOfCard
        img3.image = UIImage(named: bobai[ranIndex])
        bobai.removeAtIndex(ranIndex)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bobai = ["c1.gif","c2.gif","c3.gif","c4.gif","c5.gif","c6.gif","c7.gif","c8.gif","c9.gif","c10.gif","cj.gif","cq.gif","ck.gif","d1.gif","d2.gif","d3.gif","d4.gif","d5.gif","d6.gif","d7.gif","d8.gif","d9.gif","d10.gif","dj.gif","dq.gif","dk.gif","h1.gif","h2.gif","h3.gif","h4.gif","h5.gif","h6.gif","h7.gif","h8.gif","h9.gif","h10.gif","hj.gif","hq.gif","hk.gif","s1.gif","s2.gif","s3.gif","s4.gif","s5.gif","s6.gif","s7.gif","s8.gif","s9.gif","s10.gif","sj.gif","sq.gif","sk.gif" ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

