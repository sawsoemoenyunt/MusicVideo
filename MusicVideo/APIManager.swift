//
//  APIManager.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/18/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: [Videos] -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url){
            (data,response,error) -> Void in
            
            if error != nil {
               
                    print(error!.localizedDescription)
                
                
            }else{
                //Added for JSONSerialization
                //print(data)
                do{
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                        as? JSONDicitionary,
                        feed = json["feed"] as? JSONDicitionary,
                        entries = feed["entry"] as? JSONArray {
                            
                            var videos = [Videos]()
                            for (index, entry) in entries.enumerate(){
                               let entry = Videos(data: entry as! JSONDicitionary)
                                entry.vRank = index+1
                                videos.append(entry)
                            }
                            
                            let i = videos.count
                            print("iTunesApiManager - total count --> \(i)")
                            print(" ")
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue()){
                                    completion(videos)
                                }
                            }
                            
                    }
                }catch{
               
                        print("error in NSJSONSerialization")
                }
                //End of JSONSerialization
            }
        }
        task.resume()
    }
}