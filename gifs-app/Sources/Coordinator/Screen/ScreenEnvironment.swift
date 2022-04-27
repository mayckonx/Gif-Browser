import Foundation
import GifBrowser

public struct ScreenEnvironment {
    public var gifBrowserEnvironment: GifBrowserEnvironment
    
    public init(gifBrowserEnvironment: GifBrowserEnvironment = .init()) {
        self.gifBrowserEnvironment = gifBrowserEnvironment
    }
}
