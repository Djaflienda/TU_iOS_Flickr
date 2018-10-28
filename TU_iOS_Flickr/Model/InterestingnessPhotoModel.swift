//
//  PopularPhotoModel.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct InterestingnessPhoto {
    var url_q = ""
//    var url_z = ""
    
//    var errorMessage = ""
    
    init?(json: JSON) {
        if let url_q = json["url_q"].string {
            self.url_q = url_q
        }
//        if let url_z = json["url_z"].string {
//            self.url_z = url_z
//        }
        
//        if let errorMessage = json["message"].string {
//            self.url_q = errorMessage
//        }
    }
}
