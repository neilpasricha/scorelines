import SwiftUI
import Combine

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}
final class Feed: ObservableObject{
    @Published var CurrentFeed: [AnyView] = []
    @Published var feedIDs: [UUID] = []
//    @Published var randomNumbers = Set<Int>()
//    @State var maxValue: Int = 2147483645
//    @Published var id: Int = generateIDs(<#T##self: Feed##Feed#>)
//    
//    func generateIDs() -> Int{
//        var tmp_id = Int.random(in: 1..<2147483645)
//        while(randomNumbers.contains(tmp_id)){
//            tmp_id = Int.random(in: 1..<2147483645)
//        }
//        if(!randomNumbers.contains(tmp_id)){
//            id = tmp_id
//            randomNumbers.insert(tmp_id)
//        }
//        return id
//    }
    func contains(_ id: UUID) -> Bool {
        feedIDs.contains(id)
    }

    func append(_ view: AnyView) {
        CurrentFeed.append(view)
    }

    func add(_ view: AnyView, id: UUID) {
        guard !contains(id) else { return }
        CurrentFeed.append(view)
        feedIDs.append(id)
    }

    func remove(id: UUID) {
        guard let index = feedIDs.firstIndex(of: id) else { return }
        CurrentFeed.remove(at: index)
        feedIDs.remove(at: index)
    }

    func toggle(_ view: AnyView, id: UUID) {
        if contains(id) {
            remove(id: id)
        } else {
            add(view, id: id)
        }
    }
}
struct ContentView : View {
    
    @State var showMenu = false
    @State private var selection = 2
    @StateObject private var feed = Feed()
    @StateObject private var basketballData = readBasketballData()
    @StateObject private var footballData = readFootballData()
    
   

     
    
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
            self.basketballData.loadBasketballData()
            self.footballData.loadFootballData()
        })
                
        Print("readBasketballData.nbaComplexModel ContentView")
        Print(basketballData.basketballData)
        Print("readBasketballData.footballModel ContentView")
    }
        
}
