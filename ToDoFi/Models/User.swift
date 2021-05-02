//
//  User.swift
//  ToDoFi
//
//  Created by Сахар Кубический on 02.05.2021.
//

import Foundation
import Firebase

struct UserM {
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
