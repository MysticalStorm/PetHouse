import Foundation

struct Articles {
  
}

struct Source: Codable {
  let id: String?
  let name: String?
}

struct Article: Codable {
  let source: Source?
  let author: String?
  let content: String
  let description: String
  let publishedAt: String
  let title: String
  let url: String
  let urlToImage: String?
}

struct News: Codable {
  let articles: [Article]
}
