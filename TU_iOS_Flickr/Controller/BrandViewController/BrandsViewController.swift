//
//  ViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 16/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class BrandsViewController: UIViewController, SearchBrandDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var camerasArray = [CameraModel]()
    
    //SEARCH
    enum CardState {
        case expanded
        case collapsed
    }
    
    var cardViewController:SearchViewController!
    var visualEffectView:UIVisualEffectView! 
    
    var cardHeight:CGFloat {
            return view.frame.height - 150
    }
    
    let cardHandleAreaHeight:CGFloat = 76
    
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    // END OF SEARCH

    override func viewDidLoad() {
        super.viewDidLoad()
        //after complition with searchViewController remove this two lines
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search by brand"
        
        setupCard()
        getCamerasInfo()
        
        cardViewController.delegate = self
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
    
    //delegate method to search from childViewController
    func searchForBrand(searchText: String?) {
        getCamerasInfo(searchText: searchText)
    }
}
