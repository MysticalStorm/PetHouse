struct NewsRequest: RequestProtocol {
  enum Endpoint: String, EndpointProtocol {
    case petNews = "dog husky"
  }
  
  let endpoint: Endpoint
}
