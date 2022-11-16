import SwiftUI

@main
struct Tourist_NewsApp: App {
  let apiService: APIService = APIClient()
  var body: some Scene {
    WindowGroup {
      HomeView(newsFeedViewModel: NewsFeedViewModel(apiService: apiService),
               touristsViewModel: TouristsViewModel(apiService: apiService))
    }
  }
}
