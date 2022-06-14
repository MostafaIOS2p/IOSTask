//
//  LoginViewController.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    let loginViewModel = LoginViewModel()
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewToLoginViewModel()
        bindingViewModelToView()
    }
    
    func bindViewToLoginViewModel(){
        emailTextField.textPublisher.sink(receiveValue: { [unowned self] text in
            loginViewModel.email.send(text)
        }).store(in: &bindings)
        passwordTextField.textPublisher.sink(receiveValue: { [unowned self] text in
            loginViewModel.password.send(text)
        }).store(in: &bindings)
    }
    
    func bindingViewModelToView(){
        loginViewModel.validationResult.sink(receiveCompletion: { _ in }, receiveValue: { [unowned self] value in
            showAlert(title: "Alert", message: value, buttonTitle: "Ok")
        }).store(in: &bindings)
        loginViewModel.isLogged.sink(receiveCompletion: { _ in }, receiveValue: { [unowned self] value in
            navigateToHome()
        }).store(in: &bindings)
    }
    
    func navigateToHome(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        loginViewModel.login()
    }
}
