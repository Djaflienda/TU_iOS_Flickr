//
//  cellLarge.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class CellLarge: UITableViewCell {

    @IBOutlet weak var largeImage: UIImageView!
    
    @IBOutlet weak var cameraName: UILabel!
    
    @IBOutlet weak var megapixelsLabel: UILabel!
    @IBOutlet weak var lcdScreenSizeLabel: UILabel!
    @IBOutlet weak var memoryTypeLabel: UILabel!
    
    func fillCellWithData(from element: Camera) {
        cameraName.text = element.name
        megapixelsLabel.text = "megapixels: \(element.megapixels)"
        lcdScreenSizeLabel.text = "lcd screen size: \(element.lcdScreenSize)"
        memoryTypeLabel.text = "memory type: \(element.memoryType)"
        
        if let url = URL(string: element.largeImageURL) {
            largeImage.cacheImage(url: url)
        } else {
            largeImage.image = UIImage(named: "noImage")
        }
    }
}
