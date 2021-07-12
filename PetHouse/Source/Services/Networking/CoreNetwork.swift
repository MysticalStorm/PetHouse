import Foundation
import Alamofire
import Combine

protocol CoreNetwork {
  func request<T: Codable, P: RequestProtocol>(_ request: P, baseUrl: URL) -> AnyPublisher<T, AFError>
}

/// Mock with default url
extension CoreNetwork {
  func request<T: Codable, P: RequestProtocol>(_ request: P, baseUrl: URL = Config.apiUrl) -> AnyPublisher<T, AFError> {
    return self.request(request, baseUrl: baseUrl)
  }
}

struct CoreNetworkImplementation: CoreNetwork {
  func request<T: Codable, P: RequestProtocol>(_ request: P, baseUrl: URL = Config.apiUrl) -> AnyPublisher<T, AFError> {
    let resultUrl: URL = baseUrl.add("q", value: request.endpoint.rawValue)
    
    let publisher = AF.request(resultUrl, method: .get)
      .response(completionHandler: { (response) in
        print(response)
      })
      .responseJSON(completionHandler: { (json) in
        print(json)
      })
      .validate()
      .publishDecodable(type: T.self)
    return publisher.value()
  }
  
}
