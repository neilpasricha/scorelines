import SwiftUI
import Combine

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
class Feed: ObservableObject{
    @Published var CurrentFeed: [AnyView] = []
    @Published var feedIDs: [Int] = []
}
struct ContentView : View {
    
    @State var showMenu = false
    @State private var selection = 2
    @ObservedObject var feed: Feed = Feed()


     
    
    var body: some View {
        let drag = DragGesture()
          .onEnded {
              if $0.translation.width < -100 {
                  withAnimation {
                      self.showMenu = false
                  }
              }
          }
        
        NavigationView(){
           
            
                ZStack{
                    TabView(selection: $selection) {
                        FootballView(feed:feed)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .tabItem {
                                Image(systemName: "atom")
                                Text("Football")
                            }
                            .tag(0)
                     
                        BasketballView(feed:feed)
                            .tabItem {
                                Image(systemName: "atom")
                                Text("Basketball")
                            }
                            .tag(1)
                     
                        FeedView(feed:feed)
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Feed")
                            }
                            .tag(2)
                        
                        SoccerView(feed:feed)
                            .tabItem {
                                Image(systemName: "atom")
                                Text("Soccer")
                            }
                            .tag(3)
                     
                        BaseballView(feed:feed)
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .tabItem {
                                Image(systemName: "atom")
                                Text("Baseball")
                            }
                            .tag(4)
                    }
                    .accentColor(Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255))
                    
                    GeometryReader{_ in

                        MenuView(showMenu: $showMenu, feed:feed)
                                .offset(x: self.showMenu ?  UIScreen.main.bounds.width/2: UIScreen.main.bounds.width)
                                .animation(.default)
                        
                        .edgesIgnoringSafeArea(.bottom)
                        
                    }
                    
                    .edgesIgnoringSafeArea(.bottom)
                    .background(Color.black.opacity(self.showMenu ? 0.2 : 0))
                    .onTapGesture{
                        self.showMenu.toggle()
                    }
                    .gesture(drag)
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .toolbar{
                    ToolbarItem(placement: .principal){
                        Text("ScoreLines")
                            .font(.custom("Freehand575 BT", size: UIScreen.main.bounds.height*0.055))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .navigationBarItems(trailing:
                                        HStack{
                                        Button(action: {
                                            self.showMenu.toggle()
                                        }, label: {
                                            if self.showMenu{
                                                Image(systemName: "gearshape")
                                                    .resizable()
                                                    .frame(width: UIScreen.main.bounds.width * 0.058 , height: UIScreen.main.bounds.width * 0.058)
                                                    .foregroundColor(Color.black)
                                            }
                                            else{
                                                Image(systemName: "gearshape")
                                                    .resizable()
                                                    .frame(width: UIScreen.main.bounds.width * 0.06 , height: UIScreen.main.bounds.width * 0.06)
                                                    .foregroundColor(Color.white)
                                            }
                                        })
           
                }
                )
                
                .navigationBarColor(backgroundColor: UIColor(Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255)), tintColor: .white)
                .navigationBarTitleDisplayMode(.inline)
                
  
            }
                    
                
        
    }
}
