import Combine
import Foundation
import SharedModels
import ApiClient

public extension ApiClient {
    static func gif(limit: String, offset: String) -> AnyPublisher<GifsData, ApiError> {
        let route = Router.gif(limit: limit, offset: offset)
        return Self.requestPublisher(
            URLRequest(url: route.url, method: route.httpMethod)
        )
    }
}
