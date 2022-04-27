import TCACoordinators
import ComposableArchitecture
import GifBrowser

public enum CoordinatorAction: IndexedRouterAction, Equatable {
    case routeAction(Int, action: ScreenAction)
    case updateRoutes([Route<ScreenState>])
}

public struct CoordinatorState: Equatable, IndexedRouterState {
    public var routes: [Route<ScreenState>]
    
    public static let initialState = CoordinatorState(
        routes: [.root(.gifBrowser(.init()), embedInNavigationView: true)]
    )
}

public let coordinatorReducer: Reducer<CoordinatorState, CoordinatorAction, Void> = screenReducer
    .forEachIndexedRoute(environment: { _ in ScreenEnvironment() })
    .withRouteReducer(
        Reducer { state, action, environment in
            switch action {
            case .routeAction(_, action: .gifBrowser(.openGif(let gif))):
                state.routes.push(.gifDetails(.init(gif)))
            default: break
            }
            return .none
        }
    )
