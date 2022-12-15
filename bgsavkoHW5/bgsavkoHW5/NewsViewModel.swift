import UIKit

struct Results: Decodable {
    struct Post: Decodable {
        let title, description, url, urlToImage: String?
    }
    let articles: [Post]
}

final class NewsViewModel {
    let title: String
    let description: String
    let imageURL: URL?
    var imageData: Data? = nil

    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}
