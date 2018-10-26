//
//  TableViewExtension.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 23/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

extension BrandsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return camerasArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* search - dropList
         if brandListArray.count != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellBrand", for: indexPath) as! CellBrand
            tableView.rowHeight = 50
            cell.fillCellWithData(from: brandListArray[indexPath.row])
            return cell
         }
         */
        
        if camerasArray[indexPath.row].megapixels == nil && camerasArray[indexPath.row].lcdScreenSize == nil && camerasArray[indexPath.row].memoryType == nil {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSmall", for: indexPath) as! CellSmall
            tableView.rowHeight = 75
            
            cell.fillCellWithData(from: camerasArray[indexPath.row])
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLarge", for: indexPath) as! CellLarge
            tableView.rowHeight = 180
            
            cell.fillCellWithData(from: camerasArray[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
