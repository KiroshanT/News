//
//  DetailViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

class DetailViewController: UIViewController {
    
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
        view.text = "Account Details"
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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "DetailTableViewCell")
        tableView.tableFooterView = nil
        tableView.tableHeaderView = nil
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func goToBack() {
        popNavigation()
    }
    
    func setupUI() {
        view.addSubview(header)
        header.addSubview(buttonBack)
        header.addSubview(labelHead)
        header.addSubview(line)
        
        view.addSubview(tableView)
        
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
        
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        cell.data = data
        return cell
    }
}
