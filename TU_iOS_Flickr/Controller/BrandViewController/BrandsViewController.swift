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
    
    let networkManager = NetworkManager()
    var activity = LoadingIndicator()
    var camerasArray = [Camera]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search by brand"
        getCamerasInfo()
    }
    
    func getCamerasInfo(searchText: String? = nil) {
        // Here the loading indicator is going to be shown
        let loadingPopup = UIStoryboard(name: "Loading", bundle: nil).instantiateInitialViewController() as! LoadingPopupViewController
        present(loadingPopup, animated: true)
        
        networkManager.fetchFlickrCameras(by: searchText) { camera in
            if let camera = camera {
                print(camera)
                loadingPopup.closeLoadingPopupViewController()
                if camera[0].errorMessage != nil {
                    if let errorMessage = camera[0].errorMessage {
                        let alert = UIAlertController(title: "\(errorMessage)", message: "Let's show message depend on error code?", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default)
                        alert.addAction(action)
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    self.camerasArray = camera
                    self.tableView.reloadData()
                }
            }
        }
    }
}
