//
//  NewsModel.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import SwiftyJSON

class NewsModel {
    
    private let api = ApiClient()
    var newsList: [News] = []
    
    func getBreakingNewsData(off_set: Int, getNewsDataCallFinished: @escaping (_ status: Bool) -> Void) {
        //get data from http request
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: off_set, to: today)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormater.string(from: date!)
        
        api.sendRequest(request_url: "https://newsapi.org/v2/top-headlines?category=\(filter.category)&country=\(filter.country)&from=\(dateString)&apiKey=\(Constants.Security.api_key)", success: { (response, code) -> Void in

            if code == 200 {
                let currentData = JSON(response as Any)

                let res = currentData["articles"].arrayObject

                let jsonArray = JSON(res as Any).array

                if let jsonList = jsonArray {
                    self.newsList.removeAll()
                    for jsonObject in jsonList {
                        let news = News(author: jsonObject["author"].string ?? "",
                                        title: jsonObject["title"].string ?? "",
                                        description: jsonObject["description"].string ?? "",
                                        url: jsonObject["url"].string ?? "",
                                        thumbnail: jsonObject["urlToImage"].string ?? "",
                                        date: jsonObject["publishedAt"].string ?? "",
                                        content: jsonObject["content"].string ?? "")
                        self.newsList.append(news)
                    }
                }
                getNewsDataCallFinished(true)
            } else {
                print("Api status not equal 200")
                getNewsDataCallFinished(false)
            }
        }) { (error) -> Void in
            NSLog("Error (getNewsDataCallFinished): \(error.localizedDescription)")
            getNewsDataCallFinished(false)
        }
    }
    
    func getTopNewsData(off_set: Int, getNewsDataCallFinished: @escaping (_ status: Bool) -> Void) {
        //get data from http request
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: off_set, to: today)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormater.string(from: date!)
        
        api.sendRequest(request_url: "https://newsapi.org/v2/everything?q=bitcoin&from=\(dateString)&apiKey=\(Constants.Security.api_key)", success: { (response, code) -> Void in

            if code == 200 {
                let currentData = JSON(response as Any)

                let res = currentData["articles"].arrayObject

                let jsonArray = JSON(res as Any).array

                if let jsonList = jsonArray {
                    self.newsList.removeAll()
                    for jsonObject in jsonList {
                        let news = News(author: jsonObject["author"].string ?? "",
                                        title: jsonObject["title"].string ?? "",
                                        description: jsonObject["description"].string ?? "",
                                        url: jsonObject["url"].string ?? "",
                                        thumbnail: jsonObject["urlToImage"].string ?? "",
                                        date: jsonObject["publishedAt"].string ?? "",
                                        content: jsonObject["content"].string ?? "")
                        self.newsList.append(news)
                    }
                }
                getNewsDataCallFinished(true)
            } else {
                print("Api status not equal 200")
                getNewsDataCallFinished(false)
            }
        }) { (error) -> Void in
            NSLog("Error (getNewsDataCallFinished): \(error.localizedDescription)")
            getNewsDataCallFinished(false)
        }
    }
    
    func searchNewsData(search_key: String, off_set: Int, getNewsDataCallFinished: @escaping (_ status: Bool) -> Void) {
        //get data from http request
        let today = Date()
        let date = Calendar.current.date(byAdding: .day, value: off_set, to: today)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormater.string(from: date!)
        
        api.sendRequest(request_url: "https://newsapi.org/v2/everything?q=\(search_key)&from=\(dateString)&sortBy=popularity&apiKey=\(Constants.Security.api_key)", success: { (response, code) -> Void in

            if code == 200 {
                let currentData = JSON(response as Any)

                let res = currentData["articles"].arrayObject

                let jsonArray = JSON(res as Any).array

                if let jsonList = jsonArray {
                    self.newsList.removeAll()
                    for jsonObject in jsonList {
                        let news = News(author: jsonObject["author"].string ?? "",
                                        title: jsonObject["title"].string ?? "",
                                        description: jsonObject["description"].string ?? "",
                                        url: jsonObject["url"].string ?? "",
                                        thumbnail: jsonObject["urlToImage"].string ?? "",
                                        date: jsonObject["publishedAt"].string ?? "",
                                        content: jsonObject["content"].string ?? "")
                        self.newsList.append(news)
                    }
                }
                getNewsDataCallFinished(true)
            } else {
                print("Api status not equal 200")
                getNewsDataCallFinished(false)
            }
        }) { (error) -> Void in
            NSLog("Error (getNewsDataCallFinished): \(error.localizedDescription)")
            getNewsDataCallFinished(false)
        }
    }
}
