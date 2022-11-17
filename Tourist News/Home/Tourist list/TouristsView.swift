import SwiftUI

struct TouristsView: View {
  @ObservedObject var viewModel: TouristsViewModel
  
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        LazyVGrid(columns: [GridItem()], spacing: 20.0) {
          ForEach(viewModel.cellViewModels) { cellViewModel in
            TouristCellView(viewModel: cellViewModel)
              .onAppear {
                viewModel.fetchMoreTouristsIfNeeded(currentCell: cellViewModel)
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

struct TouristListView_Previews: PreviewProvider {
  static var previews: some View {
    let apiService: APIService = APIPreviewClient()
    return TouristsView(viewModel: TouristsViewModel(apiService: apiService))
  }
}
