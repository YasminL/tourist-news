import Combine

class NewsViewModel: ObservableObject {
  private(set) var title: String = "News"
  @Published private(set) var cellViewModels: [NewsCellViewModel] = []
  @Published private(set) var isLoadingPage = false
  
  private let apiService: APIService
  private var subscription: Set<AnyCancellable> = []
  
  private var currentPage: Int = 0
  private var isMorePagesAvailable = true
  
  init(apiService: APIService) {
    self.apiService = apiService
    
    fetchNews()
  }
  
  func fetchMoreNewsIfNeeded(cellViewModel: NewsCellViewModel) {
    let thresholdIndex = cellViewModels.index(cellViewModels.endIndex, offsetBy: -5)
    if cellViewModels.firstIndex(where: { $0.id == cellViewModel.id }) == thresholdIndex {
      fetchNews()
    }
  }
  
  private func fetchNews() {
    guard !isLoadingPage && isMorePagesAvailable else { return }
    
    isLoadingPage = true
    currentPage += 1
    
    apiService
      .fetchNews(page: currentPage)
      .handleEvents(receiveOutput: { [weak self] response in
        self?.currentPage = response.page
        self?.isMorePagesAvailable = response.totalPages > response.page
        self?.isLoadingPage = false
      })
      .sink { _ in
      } receiveValue: { [weak self] newsList in
        self?.cellViewModels += newsList.data.compactMap(NewsCellViewModel.init)
      }
      .store(in: &subscription)
  }
}

extension NewsViewModel {
  static var preview: NewsCellViewModel {
    NewsCellViewModel(news: News.default)
  }
}
