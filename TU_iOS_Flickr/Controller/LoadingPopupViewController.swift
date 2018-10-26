//
//  LoadingPopupViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 26/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class LoadingPopupViewController: UIViewController {

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadingIndicator.startAnimating()
    }
    
    func closeLoadingPopupViewController() {
        loadingIndicator.stopAnimating()
        dismiss(animated: true, completion: nil)
    }
}
