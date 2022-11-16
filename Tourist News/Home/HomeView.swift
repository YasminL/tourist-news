import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: [GridItem()], spacing: 20.0) {
          ForEach(viewModel.homeCellViewModels) { cellViewModel in
            HomeCellView(viewModel: cellViewModel)
          }
        }
      }
      .padding()
      .navigationTitle(viewModel.title)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let apiService: APIService = APIPreviewClient()
    return HomeView(viewModel: HomeViewModel(apiService: apiService))
  }
}
