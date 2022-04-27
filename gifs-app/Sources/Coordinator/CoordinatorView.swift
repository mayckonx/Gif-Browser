import SwiftUI
import ComposableArchitecture
import TCACoordinators
import FlowStacks
import GifBrowser
import GifDetails

public struct CoordinatorView: View {
    public let store: Store<CoordinatorState, CoordinatorAction>
    
    public init(store: Store<CoordinatorState, CoordinatorAction>) {
        self.store = store
    }
    
    public var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) {
                CaseLet(state: /ScreenState.gifBrowser,
                        action: ScreenAction.gifBrowser,
                        then: GifBrowserView.init
                )
                CaseLet(state: /ScreenState.gifDetails,
                        action: ScreenAction.gifDetails,
                        then: GifDetailsView.init
                )
            }
        }
    }
}
