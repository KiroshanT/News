//
//  FilterViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/19/22.
//

import UIKit
import ADCountryPicker

class FilterViewController: UIViewController {
    
    var data: News! = nil {
        didSet {
            labelHead.text = data.title
        }
    }
    
    let header: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    let buttonBack: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back_left"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(goToBack), for: .touchUpInside)
        return button
    }()
    let labelHead: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.text = "Filter"
        view.textColor = .darkGray
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 13)
        return view
    }()
    let line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    let labelCountry: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.text = "Country"
        view.textColor = .darkGray
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    let buttonCountry: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("United States - us", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(buttonCountryAction), for: .touchUpInside)
        return button
    }()
    let labelLanguage: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.text = "Language"
        view.textColor = .darkGray
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    let buttonLanguage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("United States - us", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(buttonLanguageAction), for: .touchUpInside)
        return button
    }()
    let labelCategory: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.text = "business"
        view.textColor = .darkGray
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 15)
        return view
    }()
    let buttonCategory: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitle("Business", for: .normal)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(buttonCategoryAction), for: .touchUpInside)
        return button
    }()
    
    let country_picker = ADCountryPicker()
    let language_picker = ADCountryPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        country_picker.didSelectCountryClosure = { name, code in
            print(code)
            filter.country = code.lowercased()
            self.buttonCountry.setTitle("\(name) - \(filter.country)", for: .normal)
            self.country_picker.dismiss(animated: true, completion: nil)
        }
        language_picker.didSelectCountryClosure = { name, code in
            print(code)
            filter.language = code.lowercased()
            self.buttonLanguage.setTitle("\(name) - \(filter.language)", for: .normal)
            self.language_picker.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func goToBack() {
        popNavigation()
    }
    
    @objc func buttonCountryAction() {
        let pickerNavigationController = UINavigationController(rootViewController: country_picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
    
    @objc func buttonLanguageAction() {
        let pickerNavigationController = UINavigationController(rootViewController: language_picker)
        self.present(pickerNavigationController, animated: true, completion: nil)
    }
    
    @objc func buttonCategoryAction() {
        showAlert()
    }
    
    func setupUI() {
        view.addSubview(header)
        header.addSubview(buttonBack)
        header.addSubview(labelHead)
        header.addSubview(line)
        view.addSubview(labelCountry)
        view.addSubview(buttonCountry)
        view.addSubview(labelLanguage)
        view.addSubview(buttonLanguage)
        view.addSubview(labelCategory)
        view.addSubview(buttonCategory)
        
        header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        buttonBack.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
        buttonBack.leftAnchor.constraint(equalTo: header.leftAnchor).isActive = true
        buttonBack.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonBack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        labelHead.topAnchor.constraint(equalTo: header.topAnchor).isActive = true
        labelHead.leftAnchor.constraint(equalTo: buttonBack.rightAnchor).isActive = true
        labelHead.rightAnchor.constraint(equalTo: header.rightAnchor).isActive = true
        labelHead.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        line.bottomAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        line.leftAnchor.constraint(equalTo: header.leftAnchor).isActive = true
        line.rightAnchor.constraint(equalTo: header.rightAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        labelCountry.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 10).isActive = true
        labelCountry.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelCountry.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        buttonCountry.topAnchor.constraint(equalTo: labelCountry.bottomAnchor, constant: 10).isActive = true
        buttonCountry.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonCountry.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        buttonCountry.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        labelLanguage.topAnchor.constraint(equalTo: buttonCountry.bottomAnchor, constant: 20).isActive = true
        labelLanguage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelLanguage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        buttonLanguage.topAnchor.constraint(equalTo: labelLanguage.bottomAnchor, constant: 10).isActive = true
        buttonLanguage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonLanguage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        buttonLanguage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        labelCategory.topAnchor.constraint(equalTo: buttonLanguage.bottomAnchor, constant: 20).isActive = true
        labelCategory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        labelCategory.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        buttonCategory.topAnchor.constraint(equalTo: labelCategory.bottomAnchor, constant: 10).isActive = true
        buttonCategory.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        buttonCategory.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        buttonCategory.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func showAlert() {
        let titleAttrString = NSMutableAttributedString(string: "Select Category", attributes: [.font: UIFont.boldSystemFont(ofSize: 17)])
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.setValue(titleAttrString, forKey: "attributedTitle")
        
        alert.addAction(UIAlertAction(title: "Business", style: .default, handler: { (_) in
            filter.category = "business"
            self.buttonCategory.setTitle("Business", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Entertainment", style: .default, handler: { (_) in
            filter.category = "entertainment"
            self.buttonCategory.setTitle("Entertainment", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "General", style: .default, handler: { (_) in
            filter.category = "general"
            self.buttonCategory.setTitle("General", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Health", style: .default, handler: { (_) in
            filter.category = "health"
            self.buttonCategory.setTitle("Health", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Science", style: .default, handler: { (_) in
            filter.category = "science"
            self.buttonCategory.setTitle("Science", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Sports", style: .default, handler: { (_) in
            filter.category = "sports"
            self.buttonCategory.setTitle("Sports", for: .normal)
        }))
        alert.addAction(UIAlertAction(title: "Technology", style: .default, handler: { (_) in
            filter.category = "technology"
            self.buttonCategory.setTitle("Technology", for: .normal)
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
            print("User click Dismiss button")
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
