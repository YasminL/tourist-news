import SwiftUI

struct HomeView: View {
  let newsFeedViewModel: NewsFeedViewModel
  let touristsViewModel: TouristsViewModel
  
  var body: some View {
    TabView {
      NewsFeedView(viewModel: newsFeedViewModel)
        .tabItem {
          Label("News", systemImage: "house")
        }
      TouristsView(viewModel: touristsViewModel)
        .tabItem {
          Label("Tourists", systemImage: "person")
        }
    }
    .toolbarBackground(.white, for: .tabBar)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    let apiService: APIService = APIClient()
    let newsFeedViewModel = NewsFeedViewModel(apiService: apiService)
    let touristViewModel = TouristsViewModel(apiService: apiService)
    return HomeView(newsFeedViewModel: newsFeedViewModel,
                    touristsViewModel: touristViewModel)
  }
}
