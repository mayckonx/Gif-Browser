import Foundation

public struct Pagination: Equatable {
    public let offset: Int
    public let totalCount: Int
    public let count: Int
}

extension Pagination: Decodable {
    public enum CodingKeys: String, CodingKey {
        case offset
        case totalCount = "total_count"
        case count
    }
}
