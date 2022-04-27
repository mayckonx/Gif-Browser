import SwiftUI
import ComposableArchitecture
import SDWebImageSwiftUI
import GifUI

public struct GifDetailsView: View {
    let store: Store<GifDetailsState, GifDetailsAction>
    
    public init(store: Store<GifDetailsState, GifDetailsAction>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            ScrollView(showsIndicators: false) {
                VStack {
                    GifImageView(
                        title: viewStore.gif.title,
                        imageURL: viewStore.gif.imageURL
                    )
                    .padding()
                    
                    Text(viewStore.gif.username)
                    Text(viewStore.gif.rating )
                }
            }
        }
    }
}
