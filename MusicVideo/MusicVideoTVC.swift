//
//  MusicVideoTVC.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/19/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import UIKit

class MusicVideoTVC: UITableViewController {

    var videos = [Videos]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Top MTVs"
        self.tableView.rowHeight = 132.0
        navigationController?.setToolbarHidden(false, animated: true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
        
        
    }
    
    func didLoadData(videos:[Videos]){
        
        print(reachabilitystatus)
        
        self.videos = videos
        
        for item in videos{
            print(" name = \(item.vName)")
        }
        
        for (index,item) in videos.enumerate(){
            print("\(index) name = \(item.vName)")
        }
        
        tableView.reloadData()
        
        //        for i in 0..<videos.count{
        //            let video = videos[i]
        //            print("\(i) name = \(video.vName)")
        //        }
    }
    
    func reachabilityStatusChanged(){
        
        switch reachabilitystatus{
        case NOACCESS :
            //view.backgroundColor = UIColor.redColor()
            //move back to main Queue
            dispatch_async(dispatch_get_main_queue()){
            let alert = UIAlertController(title: "No Internet Access", message: "Please make sure you are connected to the Internet", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
                action -> () in
                print("Cancel")
            }
            let deleteAction = UIAlertAction(title: "Delete", style: .Destructive){
                action -> () in
                print("Delete")
            }
            let okAction = UIAlertAction(title: "Ok", style: .Default){
                action -> () in
                print("Ok")
            }
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            alert.addAction(deleteAction)
            
            self.presentViewController(alert, animated: true, completion: nil)
            }
        default :
            //view.backgroundColor = UIColor.greenColor()
            
            if videos.count > 0{
                
                print("do not refresh API")
                
            }else{
                
                runAPI()
            }
            
        }
    }
    
    func runAPI(){
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=200/json",completion: didLoadData)
    }
    
    // Is called just as the object is about to be deallocated
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }
    
    private struct storyboard{
        static let cellReuseIdentifier = "cell"
    }
   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCellWithIdentifier(storyboard.cellReuseIdentifier,forIndexPath: indexPath) as! MusicVideoTableViewCell
        
        cell.video = videos[indexPath.row]


        return cell
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
        // Return false if you do not want the item to be re-orderable.
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
