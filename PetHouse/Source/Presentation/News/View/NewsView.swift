import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  
  var body: some View {
    VStack {
      ScrollView {
        ForEach(viewModel.currentNews, id:\.title) {
          ArticleCell(article: $0)
        }
      }
    }
    .onAppear(perform: viewModel.refreshNews)
  }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
      NewsView(viewModel:
                NewsViewModel(dataProvider:
                                NewsDataProviderImplementation(network:
                                                                Network()
                                                              )
                             )
      )
        .previewDevice("iPhone 12 Pro")
    }
}
