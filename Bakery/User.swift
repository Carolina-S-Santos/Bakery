//
//  User.swift
//  Bakery
//
//  Created by aluno-111 on 31/03/25.
//


class User: Codable {
    var username : String
    var password : String
    var userType : UserType
    
    init(username: String, password: String, userType: UserType) {
        self.username = username
        self.password = password
        self.userType = userType
    }
    
}
