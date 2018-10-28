//
//  PopularViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 24/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var photoArray = [InterestingnessPhoto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Popular"
        getPopularPhotos()
    }
    
    func getPopularPhotos() {
        let loadingPopup = UIStoryboard(name: "Loading", bundle: nil).instantiateInitialViewController() as! LoadingPopupViewController
        present(loadingPopup, animated: true)
        
        NewNetworkManager.fetchFlickr(method: .interestingnessGetList, by: nil) { info in
            loadingPopup.closeLoadingPopupViewController()
            if let interestingness = info as? [InterestingnessPhoto] {
                self.photoArray = interestingness
                self.collectionView.reloadData()
            }
            if let error = info as? [ErrorModel] {
                if let errorMessage = error[0].errorMessage {
                    let alert = UIAlertController(title: "\(errorMessage)", message: "Let's show message depend on error code?", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
