import Foundation
import SharedModels

public struct GifDetailsState: Equatable {
    public var gif: GifViewModel
    
    public init(_ gif: GifViewModel) {
        self.gif = gif
    }
}
