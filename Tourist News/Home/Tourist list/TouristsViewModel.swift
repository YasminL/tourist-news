import Foundation
import Combine

class TouristsViewModel: ObservableObject {
  private(set) var title: String = "Tourists"
  @Published private(set) var cellViewModels: [TouristCellViewModel] = []
  
  private var apiService: APIService
  private var subscriptions: Set<AnyCancellable> = []
  
  init(apiService: APIService) {
    self.apiService = apiService
    
    fetchTourists()
  }
  
  private func fetchTourists() {
    apiService
      .fetchTourists(page: "2")
      .sink { completion in
        switch completion {
        case .failure(let error):
          print("Fail with error: \(error)")
        case .finished:
          break
        }
      } receiveValue: { [weak self] tourists in
        self?.cellViewModels = tourists.data.compactMap(TouristCellViewModel.init)
      }
      .store(in: &subscriptions)
  }
}
