import Foundation

struct NotificationPost: Decodable, Identifiable {
    let title: String
    let id: Int
    let user_id: Int
    let content: String
    let username: String
    let date_created: String
    let comments: Int
    let votes: Int
    let category_id: Int
    let is_voted: Bool
    let prev_vote: Int
    let latitude: Double
    let longitude: Double
    let notificaiton_username: String
    let notification_content: String
    let notificaiton_date_created: String
    
    private enum CodingKeys: String, CodingKey {
            case title, id, user_id, content, username, date_created, comments, votes, category_id, is_voted, prev_vote, latitude, longitude, date, notificaiton_username, notification_content, notificaiton_date_created
        }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        id = try values.decode(Int.self, forKey: .id)
        user_id = try values.decode(Int.self, forKey: .user_id)
        content = try values.decode(String.self, forKey: .content)
        username = try values.decode(String.self, forKey: .username)
        date_created = convert_date(try values.decode(String.self, forKey: .date_created))
        comments = try values.decode(Int.self, forKey: .comments)
        votes = try values.decode(Int.self, forKey: .votes)
        category_id = try values.decode(Int.self, forKey: .category_id)
        is_voted = try values.decode(Bool.self, forKey: .is_voted)
        prev_vote = try values.decode(Int.self, forKey: .prev_vote)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
        notificaiton_username = try values.decode(String.self, forKey: .notificaiton_username)
        notification_content = try values.decode(String.self, forKey: .notification_content)
        notificaiton_date_created = try values.decode(String.self, forKey: .notificaiton_date_created)
    }
}
