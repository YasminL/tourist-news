import Combine

class HomeViewModel: ObservableObject {
  @Published private(set) var title: String = "Tourist News"
  @Published private(set) var homeCellViewModels: [HomeCellViewModel] = []
  
  private let apiService: APIService
  private var subscription: Set<AnyCancellable> = []
  
  init(apiService: APIService) {
    self.apiService = apiService
    
    fetchHome()
  }
  
  func fetchHome() {
    apiService
      .fetchNews()
      .sink { _ in
      } receiveValue: { [weak self] newsList in
        self?.homeCellViewModels = newsList.data.compactMap(HomeCellViewModel.init)
      }
      .store(in: &subscription)
  }
}

extension HomeViewModel {
  static var preview: HomeCellViewModel {
    HomeCellViewModel(news: News.default)
  }
}
