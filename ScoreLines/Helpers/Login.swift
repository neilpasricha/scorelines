//
//  Login.swift
//  Localist
//
//  Created by Steven Tran on 11/9/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import Foundation
import Combine

class UserAuth: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var isLoggedin:Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        let defaults = UserDefaults.standard
        let username = defaults.string(forKey: defaultsKeys.username)!
        if username != "username"
        {
            self.isLoggedin = true
        }
        else
        {
            self.isLoggedin = false
        }
    }
}

struct defaultsKeys {
    static let username = "username"
    static let password = "password"
    static let email = "email"
    static let date_joined = "date_joined"
}
