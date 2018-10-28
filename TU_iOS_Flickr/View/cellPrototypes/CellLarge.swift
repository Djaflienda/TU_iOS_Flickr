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
    
    func fillCellWithData(from element: CameraModel) {
        cameraName.text = element.name
        
        if let megapixels = element.megapixels {
            megapixelsLabel.text = "megapixels: \(megapixels)"
        }
        if let lcdScreenSize = element.lcdScreenSize {
            lcdScreenSizeLabel.text = "lcd screen size: \(lcdScreenSize)"
        }
        if let memoryType = element.memoryType {
            memoryTypeLabel.text = "memory type: \(memoryType)"
        }
        
        if let umageURL = element.largeImageURL {
            largeImage.cacheImage(url: URL(string: umageURL)!)
        } else {
            largeImage.image = UIImage(named: "noImage")
        }
    }
}
