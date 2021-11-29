//
//  Comment.swift
//  Localist
//
//  Created by Steven Tran on 9/29/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import Foundation

struct Comment: Decodable, Identifiable {
    let id: Int
    let user_id: Int
    let content: String
    let username: String
    let date_created: String
    let votes: Int
    let is_voted: Bool
    let prev_vote: Int
    
    private enum CodingKeys: String, CodingKey {
            case id, user_id, content, username, date_created, votes, is_voted, prev_vote
        }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        user_id = try values.decode(Int.self, forKey: .user_id)
        content = try values.decode(String.self, forKey: .content)
        username = try values.decode(String.self, forKey: .username)
        date_created = convert_date(try values.decode(String.self, forKey: .date_created))
        votes = try values.decode(Int.self, forKey: .votes)
        is_voted = try values.decode(Bool.self, forKey: .is_voted)
        prev_vote = try values.decode(Int.self, forKey: .prev_vote)
    }

}
