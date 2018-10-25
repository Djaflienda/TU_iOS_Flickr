//
//  SearchBarExtension.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

extension BrandsViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.isUserInteractionEnabled = false
        searchBar.showsCancelButton = true
        //loadBrandList()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        tableView.isUserInteractionEnabled = true
        searchBar.showsCancelButton = false
        searchBar.text = ""
        //brandListArray.removeAll()
        //tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        getCamerasInfo(searchText: searchBar.text)
        tableView.isUserInteractionEnabled = true
        searchBar.showsCancelButton = false
        searchBar.text = ""
        //brandListArray.removeAll()
        //tableView.reloadData()
    }
    
    /*search
     func loadBrandList() {
        let serachListManager = NetworkManagerSearch()
        self.activity.showOrHideActivityIndicator(at: self.view)
        serachListManager.fetchFlickrPhotos() { brand in
            if let brand = brand {
                self.brandListArray = brand
                self.tableView.reloadData()
                self.activity.showOrHideActivityIndicator(at: self.view)
                if self.brandListArray.count == 0 {
                    let alert = UIAlertController(title: "An error has occured", message: "More info later", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
     }
     */
}
