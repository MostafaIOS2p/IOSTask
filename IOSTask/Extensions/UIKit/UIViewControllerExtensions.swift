//
//  UIViewControllerExtensions.swift
//  ESports
//
//  Created by Mostafa Muhammad on 17/04/2022.
//

import Foundation
import UIKit

extension UIViewController{

    // show localized alert
    func showAlert(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func shareTo(activityItems: [Any]){
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}
