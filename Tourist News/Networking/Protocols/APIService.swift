import Combine

protocol APIService {
  func fetchNews() -> AnyPublisher<NewsList, APIError>
}
