//
//  DienThoaiTableViewController.swift
//  Swift25-MobilePhoneShop
//
//  Created by Tran Duc Hieu on 8/13/15.
//  Copyright © 2015 Duy-Hieu. All rights reserved.
//

import UIKit

class DienThoaiTableViewController: UITableViewController {

    var tenSP:[String]!
    var hinhSP:[String]!
    var giaSP:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tenSP = ["Apple iPhone  Plus 128GB","Samsung Galaxy Note 4 N910C","Samsung Galaxy Grand Prime G530","Nokia Lumia","HTC One Max","TC One Dual Sim 16GB","Nokia 130 Dual Sim"]
        hinhSP = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
        giaSP = ["25,590,000 VNĐ","17,990,000 VNĐ","4,990,000 VNĐ","7,990,000 VNĐ","8,990,000 VNĐ","8,590,000 VNĐ","650,000 VNĐ"]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tenSP.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        // cell.textLabel?.text = tenSP[indexPath.row]
        var image:UIImageView = UIImageView(frame: CGRectMake(0, 0, 75, 99))
        image.image = UIImage(named: hinhSP[indexPath.row])
        cell.addSubview(image)
        
        var tensp:UILabel = UILabel(frame: CGRectMake(80, 10, 250, 20))
        tensp.text = tenSP[indexPath.row]
        cell.addSubview(tensp)
        
        var giasp:UILabel = UILabel(frame: CGRectMake(80, 70, 250, 20))
        giasp.text = giaSP[indexPath.row]
        cell.addSubview(giasp)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 99
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
