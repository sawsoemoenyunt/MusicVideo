//
//  ViewController.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/18/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var videos = [Videos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",completion: didLoadData)
        
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
//        for i in 0..<videos.count{
//            let video = videos[i]
//            print("\(i) name = \(video.vName)")
//        }
    }
    

    

}

