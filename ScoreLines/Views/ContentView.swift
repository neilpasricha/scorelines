import SwiftUI
import Combine

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}

struct ContentView : View {
    
    @State var showMenu = false

    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
    }

     
    
    var body: some View {
        
        NavigationView(){
            if #available(iOS 15.0, *) {
                    
                        FeedView()
                .navigationBarTitle("ScoreLines")
                .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
                .navigationBarTitleDisplayMode(.inline)
                .background(.teal)
            } else {
                // Fallback on earlier versions
            }
            }
                    
                
        
    }
}
