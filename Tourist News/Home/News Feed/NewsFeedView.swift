import SwiftUI

struct NewsFeedView: View {
  
  @ObservedObject var viewModel: NewsFeedViewModel
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: [GridItem()], spacing: 20.0) {
          ForEach(viewModel.cellViewModels) { cellViewModel in
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
    return NewsFeedView(viewModel: NewsFeedViewModel(apiService: apiService))
  }
}
