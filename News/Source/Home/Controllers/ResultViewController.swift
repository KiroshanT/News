//
//  ResultViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/19/22.
//

import UIKit

class ResultViewController: UIViewController {
    
    var page_option: Int = 0
    var search_key: String = ""
    var off_set: Int = 0
    var isMoreScrollNeeded = false
    private var newsModel = NewsModel()
    private var newsList: [News] = []
    
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
        view.text = "News"
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
    private let tableViewResult: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "tableViewResultCell")
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        tableViewResult.delegate = self
        tableViewResult.dataSource = self
        
        if page_option == 1 {
            searchNewsData(search: search_key, off_set: off_set)
        } else if page_option == 2 {
            getBreakingNewsData(off_set: off_set)
        } else if page_option == 3 {
            getTopNewsData(off_set: off_set)
        }
    }
    
    func searchNewsData(search: String, off_set: Int) {
        ProgressView.shared.show(tableViewResult, mainText: nil, detailText: nil)
        newsModel.searchNewsData(search_key: search, off_set: off_set, getNewsDataCallFinished: { (status) in
            if status {
                if !self.newsModel.newsList.isEmpty {
                    self.isMoreScrollNeeded = true
                }
                self.newsList.append(contentsOf: self.newsModel.newsList)
            }
            self.tableViewResult.reloadData()
            ProgressView.shared.hide()
        })
    }
    
    func getBreakingNewsData(off_set: Int) {
        ProgressView.shared.show(tableViewResult, mainText: nil, detailText: nil)
        newsModel.getBreakingNewsData(off_set: off_set, getNewsDataCallFinished: { (status) in
            if !self.newsModel.newsList.isEmpty {
                self.isMoreScrollNeeded = true
            }
            self.newsList.append(contentsOf: self.newsModel.newsList)
            self.tableViewResult.reloadData()
            ProgressView.shared.hide()
        })
    }
    
    func getTopNewsData(off_set: Int) {
        ProgressView.shared.show(tableViewResult, mainText: nil, detailText: nil)
        newsModel.getTopNewsData(off_set: off_set, getNewsDataCallFinished: { (status) in
            if !self.newsModel.newsList.isEmpty {
                self.isMoreScrollNeeded = true
            }
            self.newsList.append(contentsOf: self.newsModel.newsList)
            self.tableViewResult.reloadData()
            ProgressView.shared.hide()
        })
    }
    
    @objc func goToBack() {
        popNavigation()
    }
    
    func setupUI() {
        view.addSubview(header)
        header.addSubview(buttonBack)
        header.addSubview(labelHead)
        header.addSubview(line)
        
        view.addSubview(tableViewResult)
        
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
        
        tableViewResult.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        tableViewResult.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableViewResult.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableViewResult.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "tableViewResultCell", for: indexPath) as! NewsTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        cell.data = newsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.data = newsList[indexPath.row]
        navigateTo(controller)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.newsList.count-1 && isMoreScrollNeeded { //you might decide to load sooner than
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if tableView.visibleCells.contains(cell) {
                    self.off_set -= 1
                    if self.page_option == 1 {
                        self.searchNewsData(search: self.search_key, off_set: self.off_set)
                    } else if self.page_option == 2 {
                        self.getBreakingNewsData(off_set: self.off_set)
                    } else if self.page_option == 3 {
                        self.getTopNewsData(off_set: self.off_set)
                    }
                }
            }
        }
    }
}
