import Combine

class HomeViewModel: ObservableObject {
  @Published private(set) var title: String = "Tourist News"
  
  @Published private(set) var news: [News] = []
  
  private let apiService: APIService
  private var subscription: Set<AnyCancellable> = []
  
  init(apiService: APIService) {
    self.apiService = apiService
    
    fetchHome()
  }
  
  func fetchHome() {
    apiService
      .fetchNews()
      .sink { completion in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print("fetchHome() Failed to fetch with error: \(error)")
        }
      } receiveValue: { [weak self] newsList in
        self?.news = newsList.data
      }
      .store(in: &subscription)
  }
}
