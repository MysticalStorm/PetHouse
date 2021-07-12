import SwiftUI
import SDWebImageSwiftUI

struct ArticleCell: View {
  let article: Article
  
  @State var offset: CGFloat = -1000
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .top) {
        WebImage(url: article.urlToImage?.toUrl)
          .resizable()
          .frame(width: 100, height: 100)
          .cornerRadius(10)
          .padding([.bottom, .leading, .trailing, .top], 5)
          .frame(maxWidth: 100, maxHeight: 100)
        VStack(alignment: .leading) {
          Text(article.title)
            .font(.title)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(maxHeight: 20)
            .padding([.bottom, .leading, .trailing, .top], 3)
          Divider()
          Text(article.description)
            .font(.body)
            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .frame(maxHeight: 60)
        }
      }
      HStack {
        Text("Author: \(article.author ?? "NoName")")
          .font(.footnote)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .padding(.top, 5)
          .lineLimit(1)
        Spacer()
        Text("Date: \(article.publishedAt)")
          .font(.footnote)
          .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
          .padding(.top, 5)
          .lineLimit(1)
      }
    }
    .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
    .cornerRadius(10)
    .padding([.leading, .trailing], 10)
    .offset(y: offset)
    .onAppear {
      let baseAnimation = Animation.easeInOut(duration: 1)
      //              let repeated = baseAnimation.repeatForever(autoreverses: true)
      withAnimation(baseAnimation) {
        offset = 0
      }
    }
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
