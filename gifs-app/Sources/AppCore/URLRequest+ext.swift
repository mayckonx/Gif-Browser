import Foundation

public extension URLRequest {
    init(url: URL, method: String) {
        self.init(url: url)
        self.httpMethod = method
    }
}
