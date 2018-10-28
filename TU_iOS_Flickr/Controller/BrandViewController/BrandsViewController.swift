//
//  ViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 16/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var camerasArray = [CameraModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search by brand"
        getCamerasInfo()
    }
    
    func getCamerasInfo(searchText: String? = nil) {
        let loadingPopup = UIStoryboard(name: "Loading", bundle: nil).instantiateInitialViewController() as! LoadingPopupViewController
        present(loadingPopup, animated: true)

        NewNetworkManager.fetchFlickr(method: .camerasGetBrandModels, by: searchText) { info in
            loadingPopup.closeLoadingPopupViewController()
            if let cameras = info as? [CameraModel] {
                self.camerasArray = cameras
                self.tableView.reloadData()
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
