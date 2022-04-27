import ComposableArchitecture
import SwiftUI
import SDWebImageSwiftUI
import GifUI

public struct GifBrowserView: View {
    let store: Store<GifBrowserState, GifBrowserAction>
    let layout: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    public init(store: Store<GifBrowserState, GifBrowserAction>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                if viewStore.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewStore.gifs, id: \.id) { gif in
                                GifImageView(
                                    title: gif.title,
                                    imageURL: gif.imageURL
                                )
                                .onTapGesture { viewStore.send(.openGif(gif)) }
                                .onAppear {
                                    if gif == viewStore.gifs.last {
                                        viewStore.send(.getNextGifs)
                                    }
                                }
                            }
                            .listRowBackground(Color.clear)
                        }
                        .padding(.horizontal)
                    }
                    .onAppear {
                        if !viewStore.loadedFirstTime {
                            viewStore.send(.loadGifs)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Gif Browser")
    }
}
