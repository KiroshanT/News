//
//  LoginViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit
import NotificationBannerSwift

class LoginViewController: UIViewController {
    
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
        view.text = "Sign In"
        view.textColor = .darkGray
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 20)
        return view
    }()
    let usernameTextField: UITextField = {
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
    let buttonSignIn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.setTitle("Sign in", for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return button
    }()
    let buttonSignUp: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Not a member yet?  Sign up", for: .normal)
        button.addTarget(self, action: #selector(gotoSignup), for: .touchUpInside)
        return button
    }()
    
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    @objc func gotoSignup() {
        navigateTo(SignupViewController())
    }
    
    @objc func loginAction() {
        let username: String = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password: String = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        if username.isEmpty {
            let banner = GrowingNotificationBanner(title: "Login", subtitle: "Please enter your username.", style: .danger)
            banner.show()
            return
        }
        if password.isEmpty {
            let banner = GrowingNotificationBanner(title: "Login", subtitle: "Please enter your password.", style: .danger)
            banner.show()
            return
        }
        if NewsSession.sharedInstance.user != nil {
            if NewsSession.sharedInstance.user!.user_name != username || NewsSession.sharedInstance.user!.user_pass != password {
                let banner = GrowingNotificationBanner(title: "Login", subtitle: "Username or Password does not match.", style: .danger)
                banner.show()
                return
            }
            
            let user = User(user_name: username,
                            user_pass: password,
                            access_token: username)
            NewsSession.sharedInstance.user = user
            NewsSession.sharedInstance.saveUser()
            
            let rootVC = HomeViewController()
            self.navigationController?.viewControllers = [rootVC]
        } else {
            let dialogMessage = UIAlertController(title: "Login", message: "User does not exist. please Sign up", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                let controller = SignupViewController()
                self.navigateTo(controller)
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    func setupUI() {
        view.addSubview(container)
        
        container.addSubview(label)
        container.addSubview(usernameTextField)
        container.addSubview(passwordTextField)
        container.addSubview(buttonSignIn)
        container.addSubview(buttonSignUp)
        
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        container.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        container.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        container.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        usernameTextField.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        usernameTextField.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        usernameTextField.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonSignIn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        buttonSignIn.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        buttonSignIn.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        buttonSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        buttonSignUp.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor).isActive = true
        buttonSignUp.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        buttonSignUp.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        buttonSignUp.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
