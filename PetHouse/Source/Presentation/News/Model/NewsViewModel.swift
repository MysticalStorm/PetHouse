import Combine
import Foundation

final class NewsViewModel: ObservableObject {
  
  // MARK: Variables
  private var disposables = Set<AnyCancellable>()
  private var newsDataProvider: NewsDataProvider
  
  @Published var currentNews: [Article] = []
  
  // MARK: Body
  
  init(dataProvider: NewsDataProvider) {
    self.newsDataProvider = dataProvider
    
    self.newsDataProvider
      .news
      .receive(on: DispatchQueue.main)
      .assign(to: \.currentNews, on: self)
      .store(in: &disposables)
  }
  
  // MARK: Refresh
  
  func refreshNews() {
    newsDataProvider.getNews()
  }
  
}
