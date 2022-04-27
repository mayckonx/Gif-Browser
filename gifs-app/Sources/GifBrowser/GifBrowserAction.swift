import Foundation
import ComposableArchitecture
import Combine
import SharedModels
import ApiClient

public enum GifBrowserAction: Equatable {
    case loadGifs
    case getNextGifs
    case openGif(GifViewModel)
    case gifsResponse(Result<GifsData, ApiError>)
    case appendGifs(Result<GifsData, ApiError>)
}
