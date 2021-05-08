import SwiftUI

struct MainView: View {
    var model: ApiKey
    
    var body: some View {
        VStack {
            Text("key: \(model.api)")
            TabView {
                Rectangle()
                    .fill(Color.red)
                    .tabItem { Text("News") }
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(model: ApiKey(api: "NO KEY"))
            .previewDisplayName("iPhone 12")
    }
}
