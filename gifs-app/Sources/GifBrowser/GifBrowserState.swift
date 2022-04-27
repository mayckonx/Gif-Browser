import Foundation
import SharedModels

public struct GifBrowserState: Equatable {
    public var gifs: [GifViewModel] = []
    public var isLoading: Bool = false
    public var offset: Int = 0
    public var limit: Int = 0
    public var hasGifsToLoad: Bool = true
    public var loadedFirstTime: Bool = false
    
    public init(){}
}
