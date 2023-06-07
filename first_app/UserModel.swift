//
//  UserModel.swift
//  first_app
//
//  Created by AnhPhamPC on 6/7/23.
//

import Foundation

class User {
    
    var name: String
    var avatar: String
    
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
    
    static func getUsers() -> [User] {
        var users: [User]
        = []
        for i in 1...20 {
           let temp = User(name: "username \(i)", avatar: "avatar \(i)")
            users.append(temp)
        }
        return users
    }
    
}
