import Foundation

public struct GifsData: Equatable {
    public let gifs: [Gif]
    public let pagination: Pagination
}

extension GifsData: Decodable {
    public enum CodingKeys: String, CodingKey {
        case gifs = "data"
        case pagination
    }
}
