//
//  CameraModel.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 22/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CameraModel {
    
    var name: String?
    
    var megapixels: String?
    var lcdScreenSize: String?
    var memoryType: String?
    
    var largeImageURL: String?
    var smallImageURL: String?
    
    init?(json: JSON) {        
        if let name = json["name"]["_content"].string {
            self.name = name
        }
        if let megapixels = json["details"]["megapixels"]["_content"].string {
            self.megapixels = megapixels
        }
        if let lcdScreenSize = json["details"]["lcd_screen_size"]["_content"].string {
            self.lcdScreenSize = lcdScreenSize
        }
        if let memoryType = json["details"]["memory_type"]["_content"].string {
            self.memoryType = memoryType
        }
        if let largeImageURL = json["images"]["large"]["_content"].string {
            self.largeImageURL = largeImageURL
        }
        if let smallImageURL = json["images"]["small"]["_content"].string {
            self.smallImageURL = smallImageURL
        }
    }
}
