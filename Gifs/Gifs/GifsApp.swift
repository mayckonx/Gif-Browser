import SwiftUI
import AppCore
import Combine
import Coordinator

@main
struct GifsApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: .init(initialState: .initialState,
                                  reducer: coordinatorReducer.debug(),
                                  environment: ())
            )
        }
    }
}
