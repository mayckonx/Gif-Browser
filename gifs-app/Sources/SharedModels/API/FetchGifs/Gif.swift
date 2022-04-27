import Foundation

public struct Gif: Equatable {
    public let id: String
    public let title: String
    public let url: String
    public let username: String
    public let source: String
    public let rating: String?
    public let image: Image
    
    public struct Image: Decodable, Equatable {
        public let downsized: Downsized
        
        public struct Downsized: Decodable, Equatable {
            public let url: String
        }
    }
}

extension Gif: Decodable {
    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case url
        case username
        case rating
        case source = "source_tld"
        case image = "images"
    }
}
