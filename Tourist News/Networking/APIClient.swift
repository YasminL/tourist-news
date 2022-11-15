import Combine
import Foundation

struct APIClient: APIService {
  func fetchNews() -> AnyPublisher<[News], APIError> {
    request(.fetchNews)
  }
  
  private func request<T: Decodable>(_ endpoint: APIEndpoint) -> AnyPublisher<T, APIError> {
    do {
      let request = try endpoint.request()
      
      return URLSession
        .shared
        .dataTaskPublisher(for: request)
        .tryMap { data, response -> T in
          guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
          }
          
          guard (200..<300).contains(response.statusCode) else {
            throw response.statusCode == 401 ? APIError.notAuthorized : APIError.invalidStatusCode
          }
          
          do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(T.self, from: data)
          } catch {
            throw APIError.invalidResponse
          }
        }
        .mapError { error -> APIError in
          switch error {
          case let apiError as APIError:
            return apiError
          case URLError.notConnectedToInternet:
            return APIError.noNetwork
          default:
            return APIError.unknown
          }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    } catch {
      if let apiError = error as? APIError {
        return Fail(error: apiError).eraseToAnyPublisher()
      } else {
        return Fail(error: APIError.unknown).eraseToAnyPublisher()
      }
    }
  }
}
