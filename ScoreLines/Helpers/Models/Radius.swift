//
//  Radius.swift
//  Bubble
//
//  Created by steven tran on 6/14/21.
//  Copyright © 2021 Bubble. All rights reserved.
//

import Foundation

struct Radius: Decodable {
    let radius: String
    
    private enum CodingKeys: String, CodingKey {
            case radius
        }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        radius = try values.decode(String.self, forKey: .radius)
    }
}
