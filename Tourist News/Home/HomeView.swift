import SwiftUI

struct HomeView: View {
  let newsFeedViewModel: NewsFeedViewModel
  
  init(newsFeedViewModel: NewsFeedViewModel) {
    self.newsFeedViewModel = newsFeedViewModel
    
    UITabBar.appearance().barTintColor = .white
  }
  
  var body: some View {
    TabView {
      NewsFeedView(viewModel: newsFeedViewModel)
        .tabItem {
          Label("News", systemImage: "house")
        }
      TouristListView()
        .tabItem {
          Label("Tourists", systemImage: "person")
        }
    }
    .toolbarBackground(.white, for: .tabBar)
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView(newsFeedViewModel: NewsFeedViewModel(apiService: APIPreviewClient()))
  }
}
