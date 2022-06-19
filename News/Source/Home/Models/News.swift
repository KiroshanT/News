//
//  News.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

class News {

    var author: String = ""
    var title: String = ""
    var description: String = ""
    var url: String = ""
    var thumbnail: String = ""
    var date: String = ""
    var content: String = ""
      
    init(author: String, title: String, description: String, url: String, thumbnail: String, date: String, content: String) {

        self.author = author
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.date = date
        self.content = content
    }
}
