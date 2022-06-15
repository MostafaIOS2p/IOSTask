//
//  LoginViewController.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import UIKit
import Combine

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    private let loginViewModel = LoginViewModel()
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
        loginViewModel.result.sink(receiveCompletion: { _ in }, receiveValue: { [unowned self] value in
            AnimationLoading.shared.removeSpinner()
            if value == "" {
                navigateToHome()
            } else {
                showAlert(title: "Alert", message: value, buttonTitle: "Ok")
            }
        }).store(in: &bindings)
    }
    
    func navigateToHome(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginClicked(_ sender: UIButton) {
        AnimationLoading.shared.showSpinner(onView:  (self.navigationController?.view)!)
        loginViewModel.login()
    }
}
