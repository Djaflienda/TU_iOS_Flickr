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
    
    let popularNManager = NetworkManagerPopular()
    var activity = LoadingIndicator()
    var photoArray = [PopularPhoto]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Popular"
        getPopularPhotos()
    }
    
    func getPopularPhotos() {
        // Here the loading indicator is going to be shown
        let loadingPopup = UIStoryboard(name: "Loading", bundle: nil).instantiateInitialViewController() as! LoadingPopupViewController
        present(loadingPopup, animated: true)

        popularNManager.fetchFlickrPhotos() { photo in
            if let photo = photo {
                loadingPopup.closeLoadingPopupViewController()
                if photo.count == 0 {
                    let alert = UIAlertController(title: "Something goes wrong", message: "More info later", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.photoArray = photo
                    self.collectionView.reloadData()
                }
            }
        }
    }
}
