//
//  Jwt.swift
//  Bubble
//
//  Created by steven tran on 5/12/21.
//  Copyright © 2021 Bubble. All rights reserved.
//

import Foundation
import JWTDecode

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
