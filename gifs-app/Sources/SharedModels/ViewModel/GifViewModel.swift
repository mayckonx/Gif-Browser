import Foundation

public struct GifViewModel: Equatable {
    public let id: String
    public let title: String
    public let username: String
    public let source: String
    public let rating: String?
    public let imageURL: URL?
    
    public init(
        id: String,
        title: String,
        username: String,
        source: String,
        rating: String?,
        imageURL: URL?
    ) {
        self.id = id
        self.title = title
        self.username = username
        self.source = source
        self.rating = rating
        self.imageURL = imageURL
    }
}
