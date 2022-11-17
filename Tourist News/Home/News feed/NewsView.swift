import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: [GridItem()], spacing: 20.0) {
          ForEach(viewModel.cellViewModels) { cellViewModel in
            NewsCellView(viewModel: cellViewModel)
              .onAppear {
                viewModel.fetchMoreNewsIfNeeded(cellViewModel: cellViewModel)
              }
          }
          
          if viewModel.isLoadingPage {
            ProgressView()
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
    return NewsView(viewModel: NewsViewModel(apiService: apiService))
  }
}
