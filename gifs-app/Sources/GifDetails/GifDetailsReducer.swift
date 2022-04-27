import ComposableArchitecture
import Combine
import SharedModels

public let gifDetailsReducer = Reducer<GifDetailsState, GifDetailsAction, Void> { state, action, _ in
    struct GifId: Hashable {}

    switch action {
    case let .loadGif(gif):
        state.gif = gif
        return .none
    }
}
