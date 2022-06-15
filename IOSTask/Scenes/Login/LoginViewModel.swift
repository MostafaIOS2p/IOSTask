//
//  LoginViewModel.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation
import Combine

class LoginViewModel {
    
    var email = CurrentValueSubject<String,Never>("")
    var password = CurrentValueSubject<String,Never>("")
    let result = PassthroughSubject<String,Error>()
    private var subscriptions = Set<AnyCancellable>()
    
    func login() {
        let message = validate()
        if message != nil {
            result.send(ValidationError(message: message!).localizedDescription)
        } else {
            LoginRepository().loginApi(email: email.value, password: password.value).sink { [unowned self] completion in
                switch completion{
                case .failure(let error):
                    result.send(error.localizedDescription)
                case .finished:
                    break
                }
            } receiveValue: { [unowned self] in
                result.send("")
            }
            .store(in: &subscriptions)
        }
    }
    
    private func validate() -> String? {
        if !(email.value.isValid(.email)){
            return "Description of invalid email address"
        } else if password.value == "" {
            return "Wrong password"
        }else{
            return nil
        }
    }
}
