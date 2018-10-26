//
//  NetworkManager.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkManager {
    
    func fetchFlickrCameras(by searchText: String?, complition: (([Camera]?) -> Void)?) {
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        let parameters = [
            "api_key": "4346307575616788415d84973f219e6a",
            "method": "flickr.cameras.getBrandModels",
            "brand": "\(searchText ?? "apple")",
            "format": "json",
            "nojsoncallback": "1"
        ]
        Alamofire.request(url, method: .get, parameters: parameters)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data, let json = try? JSON(data: data) else {
                        print("Error while parsing Flickr response")
                        return
                    }
                    if json["stat"] == "ok" {
                        let camerasJSON = json["cameras"]["camera"]
                        let camera = camerasJSON.arrayValue.compactMap {Camera(json: $0)}
                        complition?(camera)
                    } else {
                        //-=FIX IT=-
                        if let cameraJSON = Camera(json: json) {
                            let camera: [Camera]? = [cameraJSON]
                            complition?(camera)
                        }
                        //
                    }
                case .failure(let error):
                    print("Error while fetching photos: \(error.localizedDescription)")
                }
        }
    }
}
