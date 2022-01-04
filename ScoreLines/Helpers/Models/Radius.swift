//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
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
