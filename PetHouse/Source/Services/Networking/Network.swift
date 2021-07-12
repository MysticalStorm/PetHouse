import Foundation
import Alamofire
import Combine

class Network {
  
  // TODO: Update
  enum BasicError: Error {
    case someError
  }
  
  // MARK: Vars
  let core: CoreNetwork = CoreNetworkImplementation()
  private var disposables = Set<AnyCancellable>()
  
  // MARK: Body
  
  func requestNews(completion: @escaping (Result<[Article], Error>) -> Void) {
    core
      .request(NewsRequest(endpoint: .petNews))
      .receive(on: DispatchQueue.global())
      .map { (model: News) in
        model.articles
      }
      .sink(receiveCompletion: { error in
        print(error)
        completion(.failure(BasicError.someError))
      }, receiveValue: { (value: [Article]) in
        completion(.success(value))
      })
      .store(in: &disposables)
  }
}
