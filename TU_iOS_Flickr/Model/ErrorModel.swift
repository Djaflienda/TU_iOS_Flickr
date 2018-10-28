//
//  ErrorModel.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 28/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ErrorModel {
    
    var errorCode: Int?
    var errorMessage: String?
    
    init?(json: JSON) {
        if let errorCode = json["code"].int {
            self.errorCode = errorCode
        }
        if let errorMessage = json["message"].string {
            self.errorMessage = errorMessage
        }
    }
}
