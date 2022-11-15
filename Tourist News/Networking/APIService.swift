import Combine

protocol APIService {
  func fetchNews() -> AnyPublisher<[News], APIError>
}
