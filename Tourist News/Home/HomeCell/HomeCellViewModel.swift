struct HomeCellViewModel: Identifiable {
  
  private let news: News
  
  init(news: News) {
    self.news = news
  }
  
  var id: Int {
    news.id
  }
  
  var title: String? {
    news.title
  }
  
  var description: String? {
    news.description
  }
  
  var location: String {
    news.location
  }
}