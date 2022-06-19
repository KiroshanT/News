//
//  User.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

struct User {
    var user_name: String = ""
    var user_pass: String = ""
    var access_token: String = ""
    
    init?() {
    }
    
    init(user_name: String, user_pass: String, access_token: String) {

        self.user_name = user_name
        self.user_pass = user_pass
        self.access_token = access_token
    }
}
