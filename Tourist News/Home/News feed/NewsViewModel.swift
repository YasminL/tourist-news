import Combine

class NewsViewModel: ObservableObject {
  private(set) var title: String = "News"
  @Published private(set) var cellViewModels: [NewsCellViewModel] = []
  
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
        self?.cellViewModels = newsList.data.compactMap(NewsCellViewModel.init)
      }
      .store(in: &subscription)
  }
}

extension NewsViewModel {
  static var preview: NewsCellViewModel {
    NewsCellViewModel(news: News.default)
  }
}
