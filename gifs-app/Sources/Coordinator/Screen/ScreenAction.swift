import FlowStacks
import ComposableArchitecture
import GifBrowser
import GifDetails

public enum ScreenAction: Equatable {
    case gifBrowser(GifBrowserAction)
    case gifDetails(GifDetailsAction)
}
