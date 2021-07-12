import Combine

protocol NewsDataProvider {
  var news: Published<[Article]>.Publisher { get }
  
  func getNews()
}

final class NewsDataProviderImplementation: NewsDataProvider {
  private let network: Network
  
  // MARK: Data
  
  @Published var newsPublished: [Article] = []
  var news: Published<[Article]>.Publisher { $newsPublished }
  
  // MARK: Body
  
  init(network: Network) {
    self.network = network
  }
  
  func getNews() {
    network.requestNews { [weak self] in
      switch $0 {
      case let .success(news): self?.newsPublished = news
      case .failure(_): break // TODO: Show error
      }
    }
  }
}
