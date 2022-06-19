//
//  NewsSession.swift
//  News
//
//  Created by Kiroshan Thayaparan on 6/18/22.
//

import UIKit

class NewsSession: NSObject {
    
    static let sharedInstance = NewsSession()
    var user: User?
    
    func saveUser() {
        guard let userDefault = UserDefaults(suiteName: "com.News") else {
            return
        }
        userDefault.setValue(user?.user_name ?? "", forKey: "user_name")
        userDefault.setValue(user?.user_pass ?? "", forKey: "user_pass")
        userDefault.setValue(user?.access_token ?? "", forKey: "access_token")
        userDefault.synchronize()
    }
    
    func restoreUser() {
        var user = User()
        guard let userDefault = UserDefaults(suiteName: "com.News") else {
            return
        }
        user!.user_name = userDefault.object(forKey: "user_name") as? String ?? ""
        user!.user_pass = userDefault.object(forKey: "user_pass") as? String ?? ""
        user!.access_token = userDefault.object(forKey: "access_token") as? String ?? ""
        self.user = user
    }
    
    func deleteUser() {
        guard let userDefault = UserDefaults(suiteName: "com.News") else {
            return
        }
        userDefault.setValue("", forKey: "user_name")
        userDefault.setValue("", forKey: "user_pass")
        userDefault.setValue("", forKey: "access_token")
        userDefault.synchronize()
    }
}
