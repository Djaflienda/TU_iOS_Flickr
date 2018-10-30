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
        isSearching = false
        tableView.reloadData()
    }
    
    //show keyboard
    //UIResponder??
    //cancel button\search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        delegate?.searchForBrand(searchText: searchBar.text)
        searchBar.showsCancelButton = false
        isSearching = false
        tableView.reloadData()
        searchBar.text = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        brandsFilteredArray = brandsArray.filter({$0.name!.prefix(searchText.count) == searchText})
        isSearching = true
        tableView.reloadData()
    }
}
