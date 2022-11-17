import Combine
import Foundation

class APIPreviewClient: APIService {
  enum Resourse: String {
    case news
    case tourists
  }
  
  func fetchNews(page: Int) -> AnyPublisher<NewsList, APIError> {
    Just(stubData(resource: .news))
      .setFailureType(to: APIError.self)
      .eraseToAnyPublisher()
  }
  
  func fetchTourists(page: Int) -> AnyPublisher<Tourists, APIError> {
    Just(stubData(resource: .tourists))
      .setFailureType(to: APIError.self)
      .eraseToAnyPublisher()
  }
  
  private func stubData<T: Decodable>(resource: Resourse) -> T {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    guard let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "json") else {
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
