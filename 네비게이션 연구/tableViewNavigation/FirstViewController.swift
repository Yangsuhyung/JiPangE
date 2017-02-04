//
//  FirstViewController.swift
//  tableViewNavigation
//
//  Created by cscoi054 on 2017. 2. 1..
//  Copyright © 2017년 a. All rights reserved.
//

import UIKit


class FirstViewController: UITableViewController {


    var plantData : [String] = []
    var pictureData:[String] = []
    let reuseIdentifier = "MyCell"
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:reuseIdentifier)
        self.navigationItem.title = "Plant/Animal Image List"
        
        plantData = ["간단하게 걸어요", "그냥저냥", "다음에 또 걷고싶네요"]
        pictureData = ["어제 너무 좋았어요","연인과 걷기 좋은길"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section
        {
        case 0:
            return plantData.count
            
        case 1:
            return pictureData.count
            
        default:
            return 0
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UITableViewCell
        
        let row = indexPath.row
        let section = indexPath.section
        var cellvalue = ""
        
        switch section
        {
        case 0 :
            cellvalue = plantData[row]
        case 1 :
            cellvalue = pictureData[row]
        default :
            cellvalue = ""
        }
        
        cell.textLabel?.text = cellvalue
        let imageName = cellvalue + ".jpg"
        var image = UIImage(named:imageName)
        cell.imageView?.image = image
        // Configure the cell...

        return cell
    }



    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "TableCell", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewController : ViewController = segue.destination as! ViewController
        
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        
        let row = indexPath.row
        let section = indexPath.section
        var cellValue = ""
        
        switch section {
        case 0:
            cellValue = plantData[row]
        case 1 :
            cellValue = pictureData[row]
            
        default:
            cellValue = ""
        }
        ViewController.passData = cellValue
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
