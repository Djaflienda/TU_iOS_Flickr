//
//  cellSmall.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class CellSmall: UITableViewCell {

    @IBOutlet weak var smallImage: UIImageView!
    
    @IBOutlet weak var cameraName: UILabel!
    
    func fillCellWithData(from element: Camera) {
        cameraName.text = element.name
        
        if let url = URL(string: element.smallImageURL) {
            smallImage.cacheImage(url: url)
        } else {
            smallImage.image = UIImage(named: "noImage")
        }
        
        /*
         THIS BLOCK OF CODE LOADS AND THEN SETS IMAGE TO UIIMAGEVIEW
         BUT BECAUSE OF IMAGES HAVE TO BE LOADED EVERY TIME MY TABLEVIEW SHOWS REUSABLE CELL
         IT BECOMES A CAUSE OF FREEZING WHILE SCROLLING
         
        if let url = URL(string: element.smallImageURL) {
            if let data = try? Data(contentsOf: url) {
                smallImage.image = UIImage(data: data)
            }
        } else {
            smallImage.image = UIImage(named: "noImage")
        }
        */
    }
}
