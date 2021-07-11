import Foundation
import Alamofire
import Combine

class Network {
    
    struct Session: Codable {
        static var token: String? = "Token"
    }
    
    private var bag = Set<AnyCancellable>()
    
    func request<T: Encodable, R: Codable>(method: HTTPMethod,
                                           urlRequest: String,
                                           params: T,
                                           completion: @escaping (Result<R, AFError>) -> Void) {
        var headers: HTTPHeaders? = ["Content-Type": "application/x-www-from-urlencoded"]
        
        if let token = Session.token {
            headers?.add(HTTPHeader(name: "Authorization", value: "Bearer \(token)"))
        }
        
        AF.request(urlRequest,
                   method: method,
                   parameters: params,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers)
            .validate()
            .response(completionHandler: { response in
                print(response)
            })
            .responseJSON(completionHandler: { json in
                print(json)
            })
            .publishDecodable(type: R.self)
            .value()
            .receive(on: DispatchQueue.main)
            .sink { result in
                switch result {
                case let .failure(error):
                    completion(.failure(error))
                default: break
                }
            } receiveValue: { value in
                completion(.success(value))
            }
            .store(in: &bag) // TODO: May by should not be here
    }
    
}
