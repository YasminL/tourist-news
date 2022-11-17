import Foundation
import Combine

class TouristsViewModel: ObservableObject {
  private(set) var title: String = "Tourists"
  @Published private(set) var cellViewModels: [TouristCellViewModel] = []
  @Published private(set) var isLoadingPage = false
  
  private var apiService: APIService
  private var subscriptions: Set<AnyCancellable> = []
  
  private var currentPage: Int = 0
  private var isMorePagesAvailable = true
  
  init(apiService: APIService) {
    self.apiService = apiService
    
    fetchTourists()
  }
  
  func fetchMoreTouristsIfNeeded(currentCell: TouristCellViewModel) {
    let thresholdIndex = cellViewModels.index(cellViewModels.endIndex, offsetBy: -5)
    if cellViewModels.firstIndex(where: { $0.id == currentCell.id}) == thresholdIndex {
      fetchTourists()
    }
  }
  
  private func fetchTourists() {
    guard !isLoadingPage && isMorePagesAvailable else { return }
    
    isLoadingPage = true
    currentPage += 1
    
    apiService
      .fetchTourists(page: currentPage)
      .handleEvents(receiveOutput: { [weak self] response in
        self?.currentPage = response.page
        self?.isMorePagesAvailable = response.totalPages > response.page
        self?.isLoadingPage = false
      })
      .sink { _ in
      } receiveValue: { [weak self] tourists in
        self?.cellViewModels += tourists.data.compactMap(TouristCellViewModel.init)
      }
      .store(in: &subscriptions)
  }
}
