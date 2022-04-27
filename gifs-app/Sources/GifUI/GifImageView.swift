import ComposableArchitecture
import SDWebImageSwiftUI
import SwiftUI

public struct GifImageView: View {
    public let title: String
    public let imageURL: URL?
    
    public init(title: String, imageURL: URL?) {
        self.title = title
        self.imageURL = imageURL
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            AnimatedImage(url: imageURL)
                .resizable()
                .indicator(SDWebImageActivityIndicator.medium)
                .transition(.fade)
                .scaledToFit()
                .cornerRadius(10)
            Text(title)
                .font(.title2)
            Spacer(minLength: 20)
        }
    }
}
