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
        activity.showOrHideActivityIndicator(at: view)
        networkManager.fetchFlickrCameras(by: searchText) { camera in
            if let camera = camera {
                self.activity.showOrHideActivityIndicator(at: self.view)
                if camera.count == 0 {
                    let alert = UIAlertController(title: "Something goes wrong", message: "More info later", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.camerasArray = camera
                    self.tableView.reloadData()
                }
            }
        }
    }
}
