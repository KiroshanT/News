//
//  BaseViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController  {
    
    var navigationBar: TopNavigationBar?
    
    var containerView : UIView!
    var mapHidden = false
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.removeObserver(self)
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.orientation.isLandscape {
            DispatchQueue.main.async {
                self.appDel.myOrientation = .portrait
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        SetupViews()
    }
    
    private func SetupViews() {
        let mainContainerView = UIView()
        let containerView = view!
        
        self.containerView = containerView
        mainContainerView.addSubview(containerView)
        
        let navigationBar = TopNavigationBar()
        self.navigationBar = navigationBar
        self.navigationBar?.btnRight.isHidden = mapHidden
        mainContainerView.addSubview(navigationBar)
        navigationBar.tag = 65659898
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leftAnchor.constraint(equalTo: mainContainerView.leftAnchor, constant: 0).isActive = true
        navigationBar.rightAnchor.constraint(equalTo: mainContainerView.rightAnchor, constant: 0).isActive = true
        navigationBar.topAnchor.constraint(equalTo: mainContainerView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        navigationBar.tappedOnFilter {
            print("clicked on Filter")
            self.navigateTo(FilterViewController())
        }
        navigationBar.tappedOnProfile {
            print("clicked on profile")
            self.logout()
        }
        view = mainContainerView
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        containerView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func logout() {
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to Logout?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            NewsSession.sharedInstance.deleteUser()
            NewsSession.sharedInstance.user = nil
            let rootVC = LoginViewController()
            self.navigationController?.viewControllers = [rootVC]
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Logout Canceled")
        }
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        present(dialogMessage, animated: true, completion: nil)
    }
}
