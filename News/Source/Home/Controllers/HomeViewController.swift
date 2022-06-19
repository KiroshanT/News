//
//  HomeViewController.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private var newsModel = NewsModel()
    private var breakingNewsList: [News] = []
    private var topNewsList: [News] = []
    
    private let tableViewResult: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "NewsTableViewCell")
        tableView.register(BreakingNewsTableViewCell.self, forCellReuseIdentifier: "BreakingNewsTableViewCell")
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
        navigationBar?.mainSearchBar.delegate = self
        
        tableViewResult.delegate = self
        tableViewResult.dataSource = self
        
        view.addSubview(tableViewResult)
        tableViewResult.topAnchor.constraint(equalTo: navigationBar!.bottomAnchor).isActive = true
        tableViewResult.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableViewResult.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableViewResult.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBreakingNewsData(off_set: 0)
        getTopNewsData(off_set: 0)
    }

    func getBreakingNewsData(off_set: Int) {
        ProgressView.shared.show(tableViewResult, mainText: nil, detailText: nil)
        newsModel.getBreakingNewsData(off_set: off_set, getNewsDataCallFinished: { (status) in
            if status {
                self.breakingNewsList.append(contentsOf: self.newsModel.newsList)
            }
            self.tableViewResult.reloadData()
            ProgressView.shared.hide()
        })
    }
    
    func getTopNewsData(off_set: Int) {
        newsModel.getTopNewsData(off_set: off_set, getNewsDataCallFinished: { (status) in
            if status {
                self.topNewsList.append(contentsOf: self.newsModel.newsList)
            }
            self.tableViewResult.reloadData()
            ProgressView.shared.hide()
        })
    }
    
    @objc func buttonMoreAction(sender: UIButton) {
        let index = sender.tag
        let controller = ResultViewController()
        controller.page_option = index
        navigateTo(controller)
    }
}

extension HomeViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        navigationBar?.mainSearchBar.resignFirstResponder()
        let controller = ResultViewController()
        controller.page_option = 1
        controller.search_key = searchBar.text ?? ""
        navigateTo(controller)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        header.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: view.frame.width/2, height: 50))
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        header.addSubview(label)
        let button = UIButton(frame: CGRect(x: view.frame.width-100, y: 0, width: 100, height: 50))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("More", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        if section == 0 {
            label.text = "Breaking News"
            button.tag = 2
        } else {
            label.text = "Top News"
            button.tag = 3
        }
        button.addTarget(self, action: #selector(buttonMoreAction), for: .touchUpInside)
        header.addSubview(button)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return breakingNewsList.count
        } else {
            return topNewsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "BreakingNewsTableViewCell", for: indexPath) as! BreakingNewsTableViewCell
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
            cell.selectionStyle = .none
            cell.data = breakingNewsList[indexPath.row]
            return cell
        } else {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
            cell.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
            cell.selectionStyle = .none
            cell.data = topNewsList[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailViewController()
        controller.data = breakingNewsList[indexPath.row]
        navigateTo(controller)
    }
}
