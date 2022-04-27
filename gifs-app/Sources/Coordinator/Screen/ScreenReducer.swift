import FlowStacks
import ComposableArchitecture
import GifBrowser
import GifDetails

public let screenReducer = Reducer<ScreenState, ScreenAction, ScreenEnvironment>.combine(
    gifBrowserReducer
        .pullback(
            state: /ScreenState.gifBrowser,
            action: /ScreenAction.gifBrowser,
            environment: { _ in .init() }
        ),
    gifDetailsReducer
        .pullback(
            state: /ScreenState.gifDetails,
            action: /ScreenAction.gifDetails,
            environment: { _ in }
        )
)
