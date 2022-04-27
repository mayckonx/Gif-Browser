import SwiftUI
import ComposableArchitecture
import TCACoordinators
import Coordinator

struct RootView: View {
    let store: Store<CoordinatorState, CoordinatorAction>
    
    var body: some View {
        CoordinatorView(store: store)
    }
}
