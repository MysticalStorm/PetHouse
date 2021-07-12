import Foundation

final class MainViewModel {
  private var network: Network
  
  init(network: Network) {
    self.network = network
  }
  
  func makeNewsDataProvider() -> NewsDataProvider {
    NewsDataProviderImplementation(network: network)
  }
}
