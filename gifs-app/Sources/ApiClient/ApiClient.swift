import Combine
import Foundation

public struct ApiClient {
    public static func requestPublisher<T: Decodable>(_ request: URLRequest) -> AnyPublisher<T, ApiError> {
      URLSession.shared.dataTaskPublisher(for: request)
        .mapError { .network(error: $0) }
        .flatMap { self.requestDecoder(data: $0.data) }
        .eraseToAnyPublisher()
    }
    
    public static func executeRequest<T: Decodable>(_ publisher: Publishers.Share<URLSession.DataTaskPublisher>) -> AnyPublisher<T, ApiError> {
        publisher
        .mapError { .network(error: $0) }
        .flatMap { self.requestDecoder(data: $0.data) }
        .eraseToAnyPublisher()
    }
}

private extension ApiClient {
 static func requestDecoder<T: Decodable>(data: Data) -> AnyPublisher<T, ApiError> {
    let decoder = JSONDecoder()
    return Just(data)
      .tryMap { try decoder.decode(T.self, from: $0) }
      .mapError { .decoding(error: $0) }
      .eraseToAnyPublisher()
  }
}
