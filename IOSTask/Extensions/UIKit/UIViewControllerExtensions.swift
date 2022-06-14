//
//  UIViewControllerExtensions.swift
//  ESports
//
//  Created by Mostafa Muhammad on 17/04/2022.
//

import Foundation
import UIKit
extension UIViewController{
    

    // set view controller semantic using language key
    @objc func setSemantic(view: UIView, languageKey: String){
        if languageKey == "ar" || languageKey == "kr" {
            view.semanticContentAttribute = .forceRightToLeft
            self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
            self.tabBarController?.tabBar.semanticContentAttribute = .forceRightToLeft
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else{
            UITextField.appearance().semanticContentAttribute = .forceLeftToRight
            view.semanticContentAttribute = .forceLeftToRight
            self.navigationController?.navigationBar.semanticContentAttribute = .forceLeftToRight
            self.tabBarController?.tabBar.semanticContentAttribute = .forceLeftToRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
        
    // show localized alert
    @objc func localized(style: UIAlertController.Style, alertTitle: String, message: String, buttonTitle: String, buttonAction: @escaping () -> Void){
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: style)
        let action = UIAlertAction(title: buttonTitle, style: .default) { (_) in
            buttonAction()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

    // show localized alert
    @objc func showAlert(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }


}
