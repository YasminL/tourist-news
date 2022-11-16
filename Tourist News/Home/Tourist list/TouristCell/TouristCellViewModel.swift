import Foundation

struct TouristCellViewModel: Identifiable {
  private let viewModel: Tourist
  
  init(viewModel: Tourist) {
    self.viewModel = viewModel
  }
  
  var id: Int {
    viewModel.id
  }
  
  var name: String {
    viewModel.touristName
  }
  
  var email: String {
    viewModel.touristEmail
  }
  
  var location: String {
    viewModel.touristLocation
  }
}
