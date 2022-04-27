import FlowStacks
import ComposableArchitecture
import GifBrowser
import GifDetails

public enum ScreenState: Equatable {
    case gifBrowser(GifBrowserState)
    case gifDetails(GifDetailsState)
}
