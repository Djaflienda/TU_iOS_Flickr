//
//  NetworkManagerPopular.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkManagerPopular {

    func fetchFlickrPhotos(complition: (([PopularPhoto]?) -> Void)?) {
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        let parameters = [
            "method": "flickr.interestingness.getList",
            "api_key": "4346307575616788415d84973f219e6a",
            "extras": "url_q,url_z",
            "per_page": "30",
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
                    //should add all Error Codes here
                    let popularPhotoJSON = json["photos"]["photo"]
                    let popularPhoto = popularPhotoJSON.arrayValue.compactMap {PopularPhoto(json: $0)}
                    complition?(popularPhoto)
                case .failure(let error):
                    print("Error while fetching photos: \(error.localizedDescription)")
                }
        }
    }
}
