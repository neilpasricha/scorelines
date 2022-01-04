import SwiftUI
import Combine

extension View {
  func navigationBarColor(backgroundColor: UIColor, tintColor: UIColor) -> some View {
    self.modifier(NavigationBarColor(backgroundColor: backgroundColor, tintColor: tintColor))
  }
}

struct ContentView : View {
    
    @State var showMenu = false
    @State private var selection = 2
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.blue]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.blue]
        
        
    }

     
    
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
            if #available(iOS 15.0, *) {
            
                ZStack{
                    TabView(selection: $selection) {
                        FootballView()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .tabItem {
                                Image("football")
                                Text("Football")
                            }
                            .tag(0)
                     
                        BasketballView()
                            .tabItem {
                                Image("basketball")
                                Text("Basketball")
                            }
                            .tag(1)
                     
                        FeedView()
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Feed")
                            }
                            .tag(2)
                        
                        BaseballView()
                            .tabItem {
                                Image("baseball")
                                Text("Baseball")
                            }
                            .tag(3)
                     
                        SoccerView()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .tabItem {
                                Image("soccer")
                                Text("Soccer")
                            }
                            .tag(4)
                    }
                    .accentColor(.teal)
                
                    GeometryReader{_ in

                        MenuView(showMenu: $showMenu)
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
                                                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
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
                
                .navigationBarColor(backgroundColor: .systemTeal, tintColor: .white)
                .navigationBarTitleDisplayMode(.inline)
                
            } else {
                // Fallback on earlier versions
            }
            }
                    
                
        
    }
}
