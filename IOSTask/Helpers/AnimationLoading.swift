//
//  AnimationLoading.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 15/06/2022.
//

import Foundation
import UIKit

class AnimationLoading{
    
    weak var vSpinner : UIView?
    static let shared = AnimationLoading()
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        let ai = UIActivityIndicatorView()
        ai.style = .large
        ai.color = .white
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
            onView.bringSubviewToFront(ai)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
        
    }
    
    
}
