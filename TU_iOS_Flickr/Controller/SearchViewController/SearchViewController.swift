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
class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

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
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.resignFirstResponder()
//        searchBar.showsCancelButton = false
//        searchBar.text = ""

    }
    
    //show keyboard
    //UIResponder??
    //cancel button\search button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.titleLabel.text = brandsArray[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.searchForBrand(searchText: brandsArray[indexPath.row].name)
    }
    
    func getCamerasInfo(searchText: String? = nil) {
        NewNetworkManager.fetchFlickr(method: .getBrands, by: searchText) { info in            
            if let brands = info as? [BrandModel] {
                self.brandsArray = brands
                self.tableView.reloadData()
            } else {
                // add error handling
            }
            
        }
    }


}
