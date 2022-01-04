//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import Foundation

struct BlockedUser: Decodable, Identifiable {
    let id: Int
    let blocked_username: String
    let blocked_user_id: String
    
    private enum CodingKeys: String, CodingKey {
            case id, blocked_username, blocked_user_id
    }
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        blocked_username = try values.decode(String.self, forKey: .blocked_username)
        blocked_user_id = try values.decode(String.self, forKey: .blocked_user_id)
    }

}
