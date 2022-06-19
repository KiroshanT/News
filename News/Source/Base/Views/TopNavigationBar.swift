//
//  TopNavigationBar.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

class TopNavigationBar: UIView {
    
    let bgView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = UIColor.clear
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = false
        return bgView
    }()
    let bottomProgressBar: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.thumbTintColor = UIColor.clear
        slider.maximumTrackTintColor = Ns.color.blue
        slider.minimumTrackTintColor = Ns.color.red
        return slider
    }()
    let mainSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        //imgHeader.contentMode = .scaleAspectFit
        //imgHeader.image = #imageLiteral(resourceName: "app_logo_full")
        return searchBar
    }()
    let btnLeft: UIButton = {
        let btnProfile = UIButton()
        btnProfile.translatesAutoresizingMaskIntoConstraints = false
        btnProfile.backgroundColor = .clear
        btnProfile.setImage(UIImage(named: "logout"), for: .normal)
        return btnProfile
    }()
    let btnRight: UIButton = {
        let btnMap = UIButton()
        btnMap.translatesAutoresizingMaskIntoConstraints = false
        btnMap.backgroundColor = .clear
        btnMap.setImage(UIImage(named: "filter"), for: .normal)
        return btnMap
    }()
    
    typealias VoidCallback = ()->Void
    private var didTappedOnProfile: VoidCallback = {}
    private var didTappedOnFilter: VoidCallback = {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    @objc private func profileClicked(_ sender: Any) {
        self.didTappedOnProfile()
    }
    
    @objc private func mapClicked(_ sender: Any) {
        self.didTappedOnFilter()
    }
    
    func tappedOnProfile(_ callback: @escaping VoidCallback) -> Void {
        self.didTappedOnProfile = callback
    }
    
    func tappedOnFilter(_ callback: @escaping VoidCallback) -> Void {
        self.didTappedOnFilter = callback
    }
    
    func setUpView() {
        addSubview(bgView)
        
        bgView.addSubview(mainSearchBar)
        bgView.addSubview(btnLeft)
        bgView.addSubview(btnRight)
        bgView.addSubview(bottomProgressBar)
        
        self.bgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.bgView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        btnLeft.leftAnchor.constraint(equalTo: self.bgView.leftAnchor, constant: 10).isActive = true
        btnLeft.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btnLeft.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnLeft.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor, constant: 0).isActive = true
        
        btnRight.rightAnchor.constraint(equalTo: self.bgView.rightAnchor, constant: -10).isActive = true
        btnRight.widthAnchor.constraint(equalToConstant: 40).isActive = true
        btnRight.heightAnchor.constraint(equalToConstant: 40).isActive = true
        btnRight.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor, constant: 0).isActive = true
        
        mainSearchBar.leftAnchor.constraint(equalTo: self.btnLeft.rightAnchor, constant: 5).isActive = true
        mainSearchBar.rightAnchor.constraint(equalTo: self.btnRight.leftAnchor, constant: -5).isActive = true
        mainSearchBar.centerXAnchor.constraint(equalTo: self.bgView.centerXAnchor, constant: 0).isActive = true
        mainSearchBar.centerYAnchor.constraint(equalTo: self.bgView.centerYAnchor, constant: 0).isActive = true
        mainSearchBar.heightAnchor.constraint(equalToConstant: 45).isActive = true
        btnLeft.addTarget(self, action: #selector(self.profileClicked(_:)), for: .touchUpInside)
        btnRight.addTarget(self, action: #selector(self.mapClicked(_:)), for: .touchUpInside)
        
        bottomProgressBar.leftAnchor.constraint(equalTo: self.bgView.leftAnchor, constant: 10).isActive = true
        bottomProgressBar.rightAnchor.constraint(equalTo: self.bgView.rightAnchor, constant: -10).isActive = true
        bottomProgressBar.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottomProgressBar.bottomAnchor.constraint(equalTo: self.bgView.bottomAnchor).isActive = true
        bottomProgressBar.maximumValue = 1
        bottomProgressBar.value = 0.15
        bottomProgressBar.isHidden = false
    }
    
    func updateBottomProgressValue(_ value: Float)  {
        bottomProgressBar.isHidden = false
        bottomProgressBar.value = value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func removeView(){
        self.setHeight(0.0)
        self.bgView.removeFromSuperview()
    }
}
