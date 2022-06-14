//
//  File.swift
//  
//
//  Created by Ahmed Labeeb on 10/05/2022.
//

import Foundation

public enum ValidationType {
    
    case email, password
    
    var regex: String {
        switch self {
        case .email:
            return "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        case .password:
            return "(?=.{8,})"
        }
    }
}

public extension String {
    func isValid(_ type: ValidationType) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type.regex)
        let result = predicate.evaluate(with: self)
        return result
    }
}

