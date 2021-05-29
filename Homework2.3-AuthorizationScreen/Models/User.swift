//
//  User.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 29.05.2021.
//

import Foundation



struct User {
    let id: UUID
    var username: String
    var password: String
    var email: String
    //var questionnaire: Questionnaire
    
    init(id: UUID, username: String, password: String, email: String = "") {
        self.id = id
        self.username = username
        self.password = password
        self.email = email
    }
}
