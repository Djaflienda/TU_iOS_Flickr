//
//  SearchExtention.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 30/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.text = ""
        
    }
    
    //show keyboard
    //UIResponder??
    //cancel button\search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        delegate?.searchForBrand(searchText: searchBar.text)
        searchBar.showsCancelButton = false
        searchBar.text = ""
    }
}
