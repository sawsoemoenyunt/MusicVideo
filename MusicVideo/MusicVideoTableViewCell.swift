//
//  MusicVideoTableViewCell.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/19/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import UIKit

class MusicVideoTableViewCell: UITableViewCell {

    var video: Videos?{
        didSet{
            updateCell()
        }
    }
    
    @IBOutlet var musicImage: UIImageView!
    @IBOutlet var rank: UILabel!
    @IBOutlet var musicTitle: UILabel!
    
    func updateCell(){
        
        musicTitle.text = video?.vName
        rank.text = ("\(video!.vRank)")
        musicImage.image = UIImage(named: "imageNotAvailable")
    }
}
