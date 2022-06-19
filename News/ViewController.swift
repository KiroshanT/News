//
//  ViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI(view: view)
        validate()
    }

    func setupUI(view: UIView) {
        view.addSubview(labelTitle)
        
        labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func validate() {
        if let userDefaults = UserDefaults(suiteName: "com.News"),
        let user_access = userDefaults.string(forKey: "access_token") {
            if !user_access.isEmpty {
                NewsSession.sharedInstance.restoreUser()
                let rootVC = HomeViewController()
                self.navigationController?.viewControllers = [rootVC]
            } else {
                let rootVC = LoginViewController()
                self.navigationController?.viewControllers = [rootVC]
            }
        } else {
            let rootVC = LoginViewController()
            self.navigationController?.viewControllers = [rootVC]
        }
    }
}

