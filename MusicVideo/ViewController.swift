//
//  ViewController.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/18/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var videos = [Videos]()
    
    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=50/json",completion: didLoadData)
        
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
        case NOACCESS : view.backgroundColor = UIColor.redColor()
        displayLabel.text = "No Internet"
        case WIFI : view.backgroundColor = UIColor.greenColor()
        displayLabel.text = "Reachable with WIFI"
        case WWAN : view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachable with Cellular"
        default : return
        }
    }
    
    // Is called just as the object is about to be deallocated 
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath)
        let video = videos[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1)"
        cell.detailTextLabel?.text = video.vName
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 1
    }


}

