import Combine
import Foundation

class APIPreviewClient: APIService {
  func fetchNews() -> AnyPublisher<NewsList, APIError> {
    Just(stubData(resource: "home-news"))
      .setFailureType(to: APIError.self)
      .eraseToAnyPublisher()
  }
  
  private func stubData<T: Decodable>(resource: String) -> T {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
      fatalError("Could not find url")
    }
    
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Could not find data")
    }

    guard let stubData = try? decoder.decode(T.self, from: data) else {
        fatalError("Could not find stubData")
      }
    
    return stubData
  }
}
