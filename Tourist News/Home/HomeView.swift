import SwiftUI

struct HomeView: View {
  
  @ObservedObject var viewModel: HomeViewModel
  
    var body: some View {
        VStack {
          Text(viewModel.title)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView(viewModel: HomeViewModel(apiService: APIPreviewClient()))
    }
}
