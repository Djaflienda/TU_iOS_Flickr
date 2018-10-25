//
//  PopularNManager.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

/*
import Foundation

struct Photos: Codable {
    
    struct Photo: Codable {
        let page: Int
        let pages: Int
        let perpage: Int
        let total: String
        
        struct PhotoObject: Codable {
            let id: String
            let owner: String
            let secret: String
            let server: String
            let farm: Int
            let title: String
            let ispublic: Int
            let isfriend: Int
            let isfamily:Int
            let url_q: String?
            let url_z: String?
        }
        
        let photo: [PhotoObject]
    }
    
    let photos: Photo
    let stat: String
}

struct PopularNManager {
    
    func fetchFlickrPopularPhoto() {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.flickr.com"
        urlComponents.path = "/services/rest"
        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "flickr.interestingness.getList"),
            URLQueryItem(name: "api_key", value: "4346307575616788415d84973f219e6a"),
            URLQueryItem(name: "extras", value: "url_q,url_z"),
            URLQueryItem(name: "per_page", value: "30"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1")
        ]
        
        let task = session.dataTask(with: urlComponents.url!) { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                return
            }
            do {
                print(data)
                let decoder = JSONDecoder()
                let photos = try decoder.decode(Photos.self, from: data)
                for photo in photos.photos.photo {
                    var element = FinalPhoto()
                    if let url_q = photo.url_q {
                        element.url_q = url_q
                    }
                    if let url_z = photo.url_z {
                        element.url_z = url_z
                    }
//                    finalResultsArray.append(element)
                }
//                print(finalResultsArray)
                
                
            } catch {
                print("Error info: \(error)")
            }
        }
        task.resume()
    }
}
*/
