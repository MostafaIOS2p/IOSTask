//
//  Login.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 14/06/2022.
//

import Foundation
import FirebaseAuth
import Combine

struct LoginRepository{
    
    func loginApi (email: String, password: String) -> Future<Void,Error>{
        Future { promise in
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if let error = error, authResult == nil {
                    promise(.failure(error))
                }else{
                    promise(.success(()))
                }
            }
        }
    }
    
}
