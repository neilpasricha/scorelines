//
//  User.swift
//  Localist
//
//  Created by Steven Tran on 10/18/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import Foundation

struct User: Decodable {
    let username: String
    let user_id: String
    let email: String
    let date_joined: String
    let default_category_id: String
    
    private enum CodingKeys: String, CodingKey {
            case id, username, user_id, email, date_joined, default_category_id
        }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        username = try values.decode(String.self, forKey: .username)
        user_id = try values.decode(String.self, forKey: .user_id)
        email = try values.decode(String.self, forKey: .email)
        date_joined = convert_date(try values.decode(String.self, forKey: .date_joined))
        default_category_id = try values.decode(String.self, forKey: .default_category_id)
    }
}
