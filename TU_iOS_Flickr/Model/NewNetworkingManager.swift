//
//  NewNetworkingManager.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 28/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum RequestMethod {
    case camerasGetBrandModels
    case getBrands
    case interestingnessGetList
}

struct NewNetworkManager {
    
   static func fetchFlickr(method: RequestMethod, by searchText: String?, complition: @escaping ([AnyObject]) -> Void) {
        
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        
        var parameters: [String: String] {
            switch method {
            case .camerasGetBrandModels:
                return [
                    "api_key": "4346307575616788415d84973f219e6a",
                    "method": "flickr.cameras.getBrandModels",
                    "brand": "\(searchText ?? "olympus")",
                    "format": "json",
                    "nojsoncallback": "1"
                ]
            case .getBrands:
                return [
                    "api_key": "4346307575616788415d84973f219e6a",
                    "method": "flickr.cameras.getBrands",
                    "format": "json",
                    "nojsoncallback": "1"
                ]
            case .interestingnessGetList:
                return [
                    "method": "flickr.interestingness.getList",
                    "api_key": "4346307575616788415d84973f219e6a",
                    "extras": "url_q,url_z",
                    "per_page": "30",
                    "format": "json",
                    "nojsoncallback": "1"
                ]
            }
        }

        Alamofire.request(url, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data, let json = try? JSON(data: data) else {
                        print("Error while parsing Flickr response")
                        return
                    }
                    print(json)
                    if json["stat"] == "ok" {
                        switch method {
                        case .camerasGetBrandModels:
                            let camerasJSON = json["cameras"]["camera"]
                            let cameras = camerasJSON.arrayValue.compactMap {CameraModel(json: $0)}
                            complition(cameras as [AnyObject])
                        case .getBrands:
                            let brandJSON = json["brands"]["brand"]
                            let brands = brandJSON.arrayValue.compactMap {BrandModel(json: $0)}
                            complition(brands as [AnyObject])
                        case .interestingnessGetList:
                            let interestingnessJSON = json["photos"]["photo"]
                            let interestingnessPhotos = interestingnessJSON.arrayValue.compactMap {InterestingnessPhoto(json: $0)}
                            complition(interestingnessPhotos as [AnyObject])
                        }
                        
                        //
                    } else {
                        //-=FIX IT=-
                        let errorJSON: [ErrorModel] = [ErrorModel(json: json)!]
                        complition(errorJSON as [AnyObject])
                        //
                    }
                case .failure(let error):
                    print("Error while fetching photos: \(error.localizedDescription)")
                }
        }
    }
}
