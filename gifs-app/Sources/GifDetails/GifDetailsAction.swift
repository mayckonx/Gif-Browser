import Foundation
import ComposableArchitecture
import Combine
import SharedModels
import ApiClient

public enum GifDetailsAction: Equatable {
    case loadGif(GifViewModel)
}
