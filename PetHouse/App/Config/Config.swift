import Alamofire

// https://www.newsapi.org/v2/everything?q=Dog&from=2021-05-08&sortBy=popularity&apiKey=API_KEY

/**
 Config file
 */
struct Config {
  /// Base url for news requests
  static let apiUrl: URL = URL(string: "https://newsapi.org/v2/everything?apiKey=\(apiKey)")!
  
  /// Api key generated from plist file. Api file ignored by git. Api plist generate by script
  private static var apiKey: String {
    var model = ApiKey(api: "no key")
    if let path = Bundle.main.path(forResource: "Api", ofType: "plist") {
      let plistDict = NSDictionary(contentsOfFile: path)
      if let key = plistDict?["news_api_key"] as? String {
        model = ApiKey(api: key)
      }
    }
    return model.api
  }
}
