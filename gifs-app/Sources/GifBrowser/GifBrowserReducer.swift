import ComposableArchitecture
import Combine
import SharedModels

public let gifBrowserReducer = Reducer<GifBrowserState, GifBrowserAction, GifBrowserEnvironment> { state, action, environment in
    struct GifBrowserId: Hashable {}

    switch action {
    case .loadGifs:
        state.isLoading = true
        state.loadedFirstTime = true
        state.limit = 25

        return environment.apiClient
            .getGifs(String(state.limit), String(state.offset))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(GifBrowserAction.gifsResponse)
            .cancellable(id: GifBrowserId(), cancelInFlight: true)

    case .openGif(_):
        return .none
        
    case .getNextGifs:
        guard state.hasGifsToLoad else {
            return .none
        }
        
        state.isLoading = true

        return environment.apiClient
            .getGifs(String(state.limit), String(state.offset))
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .debounce(id: GifBrowserId(), for: 0.3, scheduler: environment.mainQueue)
            .map(GifBrowserAction.appendGifs)
            .cancellable(id: GifBrowserId(), cancelInFlight: true)

    case let .gifsResponse(.success((gifsData))):
        state.isLoading = false
        state.gifs = gifsData.gifs.map { $0.toModel() }
        state.hasGifsToLoad = gifsData.pagination.count > 0
        state.offset = gifsData.pagination.offset

        return .none

    case let .gifsResponse(.failure(error)):
        state.isLoading = false
        return .none

    case let .appendGifs(.success((gifsData))):
        state.isLoading = false
        state.gifs.append(contentsOf: gifsData.gifs.map { $0.toModel() })
        state.hasGifsToLoad = gifsData.pagination.count > 0
        state.offset = gifsData.pagination.offset
        return .none
        
    case let .appendGifs(.failure(error)):
        state.isLoading = false
        return .none
    }
}

private extension Gif {
    func toModel() -> GifViewModel {
        .init(id: id,
              title: title,
              username: username,
              source: source,
              rating: rating,
              imageURL: URL(string: image.downsized.url))
    }
}
