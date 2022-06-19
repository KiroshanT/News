//
//  SignupViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit
import NotificationBannerSwift

class SignupViewController: UIViewController {
    
    let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.text = "Sign Up"
        view.textColor = .darkGray
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.addBorder(height: 1.0, color: .lightGray)
        textField.textColor = .darkGray
        textField.placeholder = "Username"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.addBorder(height: 1.0, color: .lightGray)
        textField.textColor = .darkGray
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    let cPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.addBorder(height: 1.0, color: .lightGray)
        textField.textColor = .darkGray
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    let buttonSignUp: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Sign up", for: .normal)
        button.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Already have an Account? Sign in", for: .normal)
        button.addTarget(self, action: #selector(gotoSignin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    @objc func gotoSignin() {
        popNavigation()
    }
    
    @objc func signupAction() {
        
        let name: String = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password: String = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let cPassword: String = cPasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if name.isEmpty {
            let banner = GrowingNotificationBanner(title: "Signup", subtitle: "Please enter your username.", style: .danger)
            banner.show()
            return
        }
        if password.isEmpty {
            let banner = GrowingNotificationBanner(title: "Signup", subtitle: "Please enter your password.", style: .danger)
            banner.show()
            return
        }
        if cPassword.isEmpty {
            let banner = GrowingNotificationBanner(title: "Signup", subtitle: "Please enter the Confirm password.", style: .danger)
            banner.show()
            return
        }
        if password != cPassword {
            let banner = GrowingNotificationBanner(title: "Signup", subtitle: "Password does not match.", style: .danger)
            banner.show()
            return
        }
        
        let user = User(user_name: name,
                        user_pass: password,
                        access_token: "")
        NewsSession.sharedInstance.user = user
        NewsSession.sharedInstance.saveUser()
        showSuccessAlert()
    }
    
    func showSuccessAlert() {
        let dialogMessage = UIAlertController(title: "Success", message: "Please signin with the credencial", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let rootVC = LoginViewController()
            self.navigationController?.viewControllers = [rootVC]
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func setupUI() {
        view.addSubview(container)
        
        container.addSubview(label)
        container.addSubview(nameTextField)
        container.addSubview(passwordTextField)
        container.addSubview(cPasswordTextField)
        container.addSubview(buttonSignIn)
        container.addSubview(buttonSignUp)
        
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        container.heightAnchor.constraint(equalToConstant: 370).isActive = true
        
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        cPasswordTextField.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        cPasswordTextField.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        cPasswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonSignUp.topAnchor.constraint(equalTo: cPasswordTextField.bottomAnchor, constant: 20).isActive = true
        buttonSignUp.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        buttonSignUp.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        buttonSignUp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonSignIn.topAnchor.constraint(equalTo: buttonSignUp.bottomAnchor).isActive = true
        buttonSignIn.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        buttonSignIn.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        buttonSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
