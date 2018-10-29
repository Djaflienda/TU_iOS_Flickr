//
//  Brand.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 29/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct BrandModel {
    var name: String?
    
    init?(json: JSON) {
        if let name = json["name"].string {
            self.name = name
        }
    }
}
