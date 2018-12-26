//
//  TableViewExtention.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 30/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return brandsFilteredArray.count
        }
        return brandsArray.count != 0 ? brandsArray.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        switch isSearching {
        case true:
            cell.titleLabel.text = brandsFilteredArray[indexPath.row].name
        case false:
            if brandsArray.count != 0 {
                cell.titleLabel.text = brandsArray[indexPath.row].name
            } else {
                cell.titleLabel.text = "Unable to load brands list"
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if brandsArray.count != 0 {
            delegate?.searchForBrand(searchText: brandsArray[indexPath.row].name)
            self.resignFirstResponder()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


