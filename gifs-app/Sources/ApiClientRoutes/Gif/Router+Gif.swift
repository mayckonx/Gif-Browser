import Foundation
import ApiClient

extension Router {
    static func gif(limit: String, offset: String) -> Route {
        return Route(
            path: "/v1/gifs/trending",
            queryItems: [
                .init(name: String(describing: limit), value: limit),
                .init(name: String(describing: offset), value: offset)
            ]
        )
    }
}
