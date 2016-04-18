//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/18/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import Foundation

class Videos {
    //Data Encapsulation
    
    private var _vName:String
    private var _vImageUrl:String
    private var _vVideoUrl:String
    
    //make a getter
    
    var vName:String{
        return _vName
    }
    
    var vImageUrl:String{
        return _vImageUrl
    }
    
    var vVideoUrl:String{
        return _vVideoUrl
    }
    
    init(data:JSONDicitionary){
        // if we do not initialize all properties we will get error message
        // return from initializer without initialization all stored properties
        
        //video name
        if let name = data["im:name"] as? JSONDicitionary,
            vName = name["label"] as? String{
                self._vName = vName
        }
        else
        {
            // you may not always get back data from the JSON - you may want to display message 
            // element in the JSON unexpected
            
            _vName = ""
        }
        
        //the video image
        
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDicitionary,
            immage = image["label"] as? String{
                _vImageUrl = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else
        {
            _vImageUrl = ""
        }
        
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDicitionary,
            vHref = vUrl["attributes"] as? JSONDicitionary,
            vVideoUrl = vHref["href"] as? String{
                self._vVideoUrl = vVideoUrl
        }
        else
        {
            _vVideoUrl = ""
        }
    }
}