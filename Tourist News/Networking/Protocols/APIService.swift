import Combine

protocol APIService {
  func fetchNews(page: Int) -> AnyPublisher<NewsList, APIError>
  func fetchTourists(page: Int) -> AnyPublisher<Tourists, APIError>
}
