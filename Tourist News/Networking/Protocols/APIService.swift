import Combine

protocol APIService {
  func fetchNews() -> AnyPublisher<NewsList, APIError>
  func fetchTourists(page: String) -> AnyPublisher<Tourists, APIError>
}
