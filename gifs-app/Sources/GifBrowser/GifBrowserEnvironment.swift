import Foundation
import ComposableArchitecture
import Combine
import ApiClientRoutes

public struct GifBrowserEnvironment {
    public var apiClient: GifsClient
    public var mainQueue: AnySchedulerOf<DispatchQueue>
    
    public init(apiClient: GifsClient = .live,
                mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()) {
        self.apiClient = apiClient
        self.mainQueue = mainQueue
    }
}
