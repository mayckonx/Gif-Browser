import Foundation

public struct Router {}

public struct Route {
    private enum Constants {
        static let scheme = "https"
        static let baseURL = "api.giphy.com"
        static let apiKey = "YCmWGFXiSqRIfydCMHzmI757wMA55HJU"
    }
    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    public let path: String
    public let queryItems: [URLQueryItem]?
    public let httpMethod: String
    
    public init(path: String,
         queryItems: [URLQueryItem]? = nil,
         httpMethod: HTTPMethod = .get) {
        self.path = path
        self.queryItems = queryItems
        self.httpMethod = httpMethod.rawValue
    }
    
    public var url: URL {
        var components = URLComponents()
        
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.path = path
        components.queryItems = baseParams + (queryItems ?? [])
        guard let componentsUrl = components.url else { fatalError("Invalid URL") }
        return componentsUrl
    }
}

private extension Route {
    var baseParams: [URLQueryItem] {
        return [.init(name: "api_key", value: Constants.apiKey)]
    }
}

