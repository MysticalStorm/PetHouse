//
//  Config.swift
//  PetHouse
//
//  Created by Виктория Цой on 09.05.2021.
//

import Alamofire

// https://www.newsapi.org/v2/everything?q=Dog&from=2021-05-08&sortBy=popularity&apiKey=API_KEY
struct Config {
    static let apiUrl: URL = URL(string: "https://www.newsapi.org/v2/everything?apiKey=\(apiKey)")!
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
