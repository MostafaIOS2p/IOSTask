//
//  BaseViewController.swift
//  El 7ag
//
//  Created by Mostafa IOS on 6/7/18.
//  Copyright © 2018 Atiaf. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITextFieldDelegate,UISearchBarDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }

}
