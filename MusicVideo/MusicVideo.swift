//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by SawSMN's MacBook Pro on 4/18/16.
//  Copyright © 2016 Saw Soe Moe Nyunt. All rights reserved.
//

import Foundation

class Videos {
    
    var vRank = 0
    
    //Data Encapsulation
    
    private var _vName:String
    private var _vRight:String
    private var _VPrice:String
    private var _vImageUrl:String
    private var _VArtist:String
    private var _vVideoUrl:String
    private var _vLmid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDte:String
    
    
    //make a getter
    
    var vName:String{
        return _vName
    }
    
    var vRight:String{
        return _vRight
    }
    
    var vPrice:String{
        return _VPrice
    }
    
    var vImageUrl:String{
        return _vImageUrl
    }
    
    var vArtist:String{
        return _VArtist
    }
    
    var vVideoUrl:String{
        return _vVideoUrl
    }
    
    var vLmid:String{
        return _vLmid
    }
    
    var vGenre:String{
        return _vGenre
    }
    
    var vLinkToiTunes:String{
        return _vLinkToiTunes
    }
    
    var vReleaseDte:String{
        return _vReleaseDte
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
        
        //video right
        if let right = data["rights"] as? JSONDicitionary,
            vRight = right["label"] as? String{
                self._vRight = vRight
        }
        else{
            _vRight = ""
        }
        
        //price
        if let price = data["im:price"] as? JSONDicitionary,
            vPrice = price["label"] as? String{
                self._VPrice = vPrice
        }
        else
        {
            _VPrice = ""
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
        
        //artist
        if let artist = data["im:artist"] as? JSONDicitionary,
            vArtist = artist["label"] as? String{
                self._VArtist = vArtist
        }
        else
        {
            _VArtist = ""
        }

        //video
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
        
        //Lmid
        if let lmid = data["id"] as? JSONDicitionary,
            vatt = lmid["attributes"] as? JSONDicitionary,
            vLmid = vatt["im:id"] as? String{
                self._vLmid = vLmid
        }
        else
        {
            
            _vLmid = ""
        }
        
        //Genre
        if let genre = data["category"] as? JSONDicitionary,
            vcate = genre["attributes"] as? JSONDicitionary,
            vGenre = vcate["label"] as? String{
                self._vGenre = vGenre
        }
        else
        {
            
            _vGenre = ""
        }
        
        //Link to iTunes
        if let lit = data["link"] as? JSONArray,
            lUrl = lit[0] as? JSONDicitionary,
            lHref = lUrl["attributes"] as? JSONDicitionary,
            vLinkToiTunes = lHref["href"] as? String{
                self._vLinkToiTunes = vLinkToiTunes
        }
        else
        {
            _vLinkToiTunes = ""
        }
        
        //Release Date
        if let rdate = data["im:releaseDate"] as? JSONDicitionary,
            vReleaseDte = rdate["label"] as? String{
                self._vReleaseDte = vReleaseDte
        }
        else
        {
            _vReleaseDte = ""
        }


    }
}