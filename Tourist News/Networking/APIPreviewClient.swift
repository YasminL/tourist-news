import Combine
import Foundation

class APIPreviewClient: APIService {
  enum Resource: String {
    case news
  }

  func fetchNews() -> AnyPublisher<NewsList, APIError> {
    Just(stubData(resource: .news))
      .setFailureType(to: APIError.self)
      .eraseToAnyPublisher()
  }
  
  private func stubData<T: Decodable>(resource: Resource) -> T {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    guard
      let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let stubData = try? decoder.decode(T.self, from: data) else {
        fatalError("Could not find stubData")
      }
    
    return stubData
  }
}
