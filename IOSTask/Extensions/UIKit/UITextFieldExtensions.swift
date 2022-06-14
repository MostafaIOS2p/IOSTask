//
//  UITextFieldExtensions.swift
//  Gamers
//
//  Created by Mostafa Muhammad on 16/04/2022.
//

import UIKit
import Combine

extension UITextField{
    
    
    @IBInspectable var padding: CGFloat {
        get {
            return self.padding
        }
        set {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.height))
            self.leftView = view
            self.leftViewMode = .always
            self.rightView = view
            self.rightViewMode = .always
        }
    }
    
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField } // receiving notifications with objects which are instances of UITextFields
            .compactMap(\.text) // extracting text and removing optional values (even though the text cannot be nil)
            .eraseToAnyPublisher()
    }
}
