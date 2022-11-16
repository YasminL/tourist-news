import SwiftUI

@main
struct Tourist_NewsApp: App {
  var body: some Scene {
    WindowGroup {
      HomeView(newsFeedViewModel: NewsFeedViewModel(apiService: APIClient()))
    }
  }
}
