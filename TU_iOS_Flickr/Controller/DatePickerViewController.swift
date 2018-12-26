//
//  DatePickerViewController.swift
//  TU_iOS_Flickr
//
//  Created by Djaflienda on 26/10/2018.
//  Copyright © 2018 Igor Tumanov. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        
        UIView.animate(withDuration: 0.6) {
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
