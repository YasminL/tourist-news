import Combine

class NewsFeedViewModel: ObservableObject {
  private(set) var title: String = "News"
  @Published private(set) var cellViewModels: [NewsFeedCellViewModel] = []
  
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
        self?.cellViewModels = newsList.data.compactMap(NewsFeedCellViewModel.init)
      }
      .store(in: &subscription)
  }
}

extension NewsFeedViewModel {
  static var preview: NewsFeedCellViewModel {
    NewsFeedCellViewModel(news: News.default)
  }
}
