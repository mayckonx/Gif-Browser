import Foundation
import ComposableArchitecture
import SharedModels
import ApiClient

public struct GifsClient {
    public var getGifs: (_ limit: String, _ offset: String) -> Effect<GifsData, ApiError>
}

public extension GifsClient {
    static let live = GifsClient { limit, offset in
        ApiClient.gif(limit: limit, offset: offset).eraseToEffect()
    }
}

// MARK: - Mock

extension GifsClient {
    public static func mock(getGifs: @escaping (_ limit: String, _ offset: String) -> Effect<GifsData, ApiError> = {_,_  in fatalError("Unmocked")}
    ) -> Self {
        Self(getGifs: getGifs)
    }
}
