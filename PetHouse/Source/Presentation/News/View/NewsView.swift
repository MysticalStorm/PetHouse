import SwiftUI

struct NewsView: View {
  @ObservedObject var viewModel: NewsViewModel
  @State var animate: Bool = false
  @State var firstAnimate: Bool = true
  
  var body: some View {
    VStack {
      ScrollView {
        LazyVStack(spacing: 10) {
          ForEach(Array(viewModel.currentNews.enumerated()), id:\.offset) { offset, item in
            ArticleCell(article: item, animate: $animate)
              .offset(y: animate ? 0 : CGFloat(offset) * -100.0)
              .shadow(radius: 10)
          }
        }
      }
    }
    .padding(.top)
    .background(Color.black)
    .onAppear(perform: viewModel.refreshNews)
    .onTapGesture {
      if firstAnimate {
        animate.toggle()
        firstAnimate.toggle()
      }
    }
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
