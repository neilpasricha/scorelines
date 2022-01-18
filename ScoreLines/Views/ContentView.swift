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
    @Published var excludeList: [Int] = []
    @Published var gameIDs: [Int] = Array(0...1000)
//    @Published var randomNumbers = Set<Int>()
//    @State var maxValue: Int = 2147483645
//    @Published var id: Int = generateIDs(<#T##self: Feed##Feed#>)
//    
    func generateIDs() -> Int{
        var random = Int.random(in: 0...1000)
        while(feedIDs.contains(random)){
            random = Int.random(in: 0...1000)
        }
        
        return random
    }
    
}
struct ContentView : View {
    
    @State var showMenu = false
    @State private var selection = 2
    @ObservedObject var feed: Feed = Feed()
    @ObservedObject var jsonData = readJSONData()
   

     
    
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
                            .background(
                                Image("sl_logo_large")
                                .resizable()
                                //width = 0.5 and height = 0.375 seem to be really good
                                //0.625 and 0.46875 are 25% larger than above
                            .frame(width: UIScreen.main.bounds.width*0.625, height: UIScreen.main.bounds.height*0.46875),
                                alignment: .center
                                )
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
                //grey: #303030
  
            }
        
        .onAppear(perform: {
            self.jsonData.loadData()
            self.jsonData.dataLoaded = true
            
        })
                
        Print("jsonData.nbaComplexModel ContentView")
        Print(jsonData.nbaComplexModel)
    }
        
}


