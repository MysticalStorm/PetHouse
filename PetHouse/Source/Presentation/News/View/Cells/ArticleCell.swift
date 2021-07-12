import SwiftUI
import SDWebImageSwiftUI

struct ArticleCell: View {
  let article: Article
  
    var body: some View {
      VStack(alignment: .leading) {
        Text(article.title)
          .padding([.bottom, .leading, .trailing, .top], 10)
          .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.yellow)
          )
        HStack(alignment: .top) {
          WebImage(url: article.urlToImage?.toUrl)
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            .padding([.bottom, .leading, .trailing, .top], 5)
          Text(article.description)
            .foregroundColor(Color.white)
            .padding(.bottom, 5)
        }
        .frame(maxWidth: .infinity)
      }
      .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red))
      .padding([.leading, .trailing, .bottom], 10)
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
      ArticleCell(article: Article(source: nil,
                                   author: "Author",
                                   content: "Some content",
                                   description: "Some desc",
                                   publishedAt: "10:10 2010",
                                   title: "This is title",
                                   url: "www.image.com",
                                   urlToImage: "www.image.com"))
        .previewDevice("iPhone 12 Pro")
    }
}
