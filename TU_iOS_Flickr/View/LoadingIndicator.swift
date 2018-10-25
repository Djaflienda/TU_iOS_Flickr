//
//  LoadingIndicator.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

struct LoadingIndicator {
    
    var isShown = false
    
    mutating func showOrHideActivityIndicator(at view: UIView) {
        
        //creating loading view
        let background = UIView(frame: CGRect(origin: CGPoint(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2 - 50), size: CGSize(width: 100, height: 100)))
        background.backgroundColor = UIColor.black
        background.alpha = 0.5
        background.layer.cornerRadius = 20
        background.tag = 100
        
        let loadingLabel = UILabel(frame: CGRect(origin: CGPoint(x: background.bounds.width / 2 - 40, y: 10), size: CGSize(width: 80, height: 20)))
        loadingLabel.text = "Loading"
        loadingLabel.textColor = UIColor.white
        loadingLabel.textAlignment = .center
        background.addSubview(loadingLabel)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(origin: CGPoint(x: background.bounds.width / 2 - 30, y: 40), size: CGSize(width: 60, height: 60)))
        loadingIndicator.style = .whiteLarge
        loadingIndicator.isHidden = false
        background.addSubview(loadingIndicator)
        
        if isShown {
            if let viewWithTag = view.viewWithTag(100) {
                viewWithTag.removeFromSuperview()
                loadingIndicator.stopAnimating()
                isShown = false
            }
        } else {
            view.addSubview(background)
            loadingIndicator.startAnimating()
            isShown = true
        }
    }
}
