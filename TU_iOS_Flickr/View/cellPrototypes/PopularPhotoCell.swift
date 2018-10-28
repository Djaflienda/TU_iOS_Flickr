//
//  PopularPhotoCell.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class PopularPhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    func fillCellWithData(from element: InterestingnessPhoto) {
        
        if let url = URL(string: element.url_q) {
            image.cacheImage(url: url)
        } else {
            image.image = UIImage(named: "noImage")
        }
    }
}
