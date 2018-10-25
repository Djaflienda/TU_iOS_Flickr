//
//  CacheImages.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func cacheImage(url: URL) {
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    if let imageToCache = UIImage(data: response) {
                        imageCache.setObject(imageToCache, forKey: url as AnyObject)
                        self.image = imageToCache
                    } else {
                        self.image = UIImage(named: "noImage")
                    }
                }
            }
        }.resume()
    }
}
