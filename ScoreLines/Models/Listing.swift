import Foundation

/// Root of Reddit API response
struct Listing: Decodable {
    let data: ListingData
    var posts: [Post] {
        return data.children.map { (postData) -> Post in
            postData.data
        }
    }
    
    struct ListingData: Decodable {
        let children: [PostData]
        
        struct PostData: Decodable {
            let data: Post
        }
    }
}

