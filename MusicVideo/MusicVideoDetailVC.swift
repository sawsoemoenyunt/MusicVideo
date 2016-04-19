//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/19/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class MusicVideoDetailVC: UIViewController {

    var videos : Videos!
    
    @IBOutlet var vName: UILabel!
    
    @IBOutlet var videoImage: UIImageView!
    
    @IBOutlet var vGenre: UILabel!
    
    @IBOutlet var vPrice: UILabel!
    
    @IBOutlet var vRights: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRight
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil{
            videoImage.image = UIImage(data: videos.vImageData!)
        }
        else
        {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
        
    }

    @IBAction func playVideo(sender: AnyObject) {
        
        let url = NSURL(string: videos.vVideoUrl)!
        let player = AVPlayer(URL: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.presentViewController(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
    
}
