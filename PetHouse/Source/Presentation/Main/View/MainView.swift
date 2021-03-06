import SwiftUI

struct MainView: View {
  let viewModel: MainViewModel
  
  var body: some View {
    VStack {
      TabView {
        NewsView(viewModel:
                  NewsViewModel(dataProvider: viewModel.makeNewsDataProvider()))
          .tabItem {
            Image(systemName: "cloud")
            Text("News")
          }
        Rectangle()
          .fill(Color.yellow)
          .tabItem { Text("Community") }
        Rectangle()
          .fill(Color.blue)
          .tabItem { Text("Doctor") }
        Rectangle()
          .fill(Color.black)
          .tabItem { Text("Account") }
      }
    }
    .preferredColorScheme(.dark)
    .onAppear {
      UITabBar.appearance().barTintColor = .black
      UITabBar.appearance().tintColor = .white
      UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
      UITabBar.appearance().clipsToBounds = true
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel(network: Network()))
      .previewDisplayName("iPhone 12")
  }
}
