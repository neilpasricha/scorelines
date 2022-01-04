//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import Foundation

struct Jwt: Decodable {
    let token: String
    
    private enum CodingKeys: String, CodingKey {
            case token
        }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decode(String.self, forKey: .token)
    }
}
