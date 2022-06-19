//
//  Filter.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/19/22.
//

class Filter {
    
    var country: String
    var language: String
    var category: String
    
    init(country: String, language: String, category: String) {
        self.country = country
        self.language = language
        self.category = category
    }
}

var filter = Filter(country: "us", language: "us", category: "business")
