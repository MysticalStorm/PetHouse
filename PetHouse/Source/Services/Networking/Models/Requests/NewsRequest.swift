struct NewsRequest: RequestProtocol {
  enum Endpoint: String, EndpointProtocol {
    case petNews = "dog"
  }
  
  let endpoint: Endpoint
}
