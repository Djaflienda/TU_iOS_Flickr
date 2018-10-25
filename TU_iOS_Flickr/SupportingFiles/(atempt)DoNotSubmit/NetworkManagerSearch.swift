//
//  NetworkManagerSearch.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

/*
import Foundation
import Alamofire
import SwiftyJSON

struct BrandItem {
    
    var name = ""
    
    init?(json: JSON) {
        if let name = json["name"].string {
            self.name = name
        }
    }
}

struct NetworkManagerSearch {
    
    func fetchFlickrPhotos(complition: (([BrandItem]?) -> Void)?) {
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        let parameters = [
            "method": "flickr.cameras.getBrands",
            "api_key": "4346307575616788415d84973f219e6a",
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
                    print(response)
                    //should add all Error Codes here
                    let brandListJSON = json["brands"]["brand"]
                    let brandList = brandListJSON.arrayValue.compactMap {BrandItem(json: $0)}
                    complition?(brandList)
                case .failure(let error):
                    print("Error while fetching photos: \(error.localizedDescription)")
                }
        }
    }
}
*/
