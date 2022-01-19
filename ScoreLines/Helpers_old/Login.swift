//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
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
