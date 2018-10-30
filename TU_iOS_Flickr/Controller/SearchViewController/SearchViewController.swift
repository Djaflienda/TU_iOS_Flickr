//
//  SearchViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 28/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

protocol SearchBrandDelegate {
    func searchForBrand(searchText: String?)
}

//refactoring
class SearchViewController: UIViewController {

    @IBOutlet weak var handleArea: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var brandsViewController: BrandsViewController!
    var brandsArray = [BrandModel]()
    var delegate: SearchBrandDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //to remove UISearchBar Boarders
        searchBar.backgroundImage = UIImage()
        
        //I have to register xib view to use it(or something like this)
        let nib = UINib.init(nibName: "SearchCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SearchCell")
        
        getCamerasInfo()
        
        searchBar.isUserInteractionEnabled = false
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }

    func getCamerasInfo(searchText: String? = nil) {
        NewNetworkManager.fetchFlickr(method: .getBrands, by: searchText) { info in            
            if let brands = info as? [BrandModel] {
                self.brandsArray = brands
                self.tableView.reloadData()
            } else {
                // add error handling
                // if there is an error - show just one line in table view with something like "No available information"
            }
            
        }
    }
    
    @objc
    func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            tableView.contentInset = UIEdgeInsets.zero
        } else {
            // don't like force unwrapping here -=FIX IT=-
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - (navigationController?.navigationBar.frame.height)!, right: 0)
        }
        
        tableView.scrollIndicatorInsets = tableView.contentInset
    }
}
