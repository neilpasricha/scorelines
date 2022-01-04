//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//
//SPORT KEY:
//0 = NBA
//1 = NCAAM
//2 = NFL
//3 = CFB
//4 = Baseball
//5 = Soccer
import SwiftUI

struct FeedView: View {
    let categories = ["Deals":1, "Happy Hour":2, "Recreation":3, "What's Happening?":4, "Misc":5]
    static var currentFeed: [Any] = []
    @State private var showSortSheet: Bool = false
    @State private var showSubmitPost: Bool = false
    @State private var showCreateUser: Bool = false
    @State private var post_content: String = ""
    @State private var isMenu: Bool = false
    @State private var currCategory: String = ""
    @State private var isShowing = false
    @State private var showComplex = false
    @State private var isClicked = false
    var body: some View
    {
        //SPORT KEY:
        //0 = NBA
        //1 = NCAAM
        //2 = NFL
        //3 = CFB
        //4 = Baseball
        //5 = Soccer
        /*
         .simultaneousGesture(
             LongPressGesture()
                 .onEnded { _ in
                     print("Loooong")
                 }
         )
         .highPriorityGesture(TapGesture()
                                 .onEnded { _ in
                                     print("Tap")
                                 })
         
         .onTapGesture(perform:{
             NBASimple()
         })
         .onLongPressGesture(perform:{
             print("Added to currentfeed")
             FeedView.currentFeed.append(NBAComplex())
         })
         */
            if #available(iOS 15.0, *) {
                ScrollView{
                    VStack{
//                        Button(action:{
//                            print("")
//                        }){
//                            if(isClicked){
//
//                                NBAComplex()
//                            }
//                            else{
//                                NBASimple()
//                            }
//                        }
//                            .simultaneousGesture(LongPressGesture().onEnded { _ in
//                                if(isClicked){
//
//
//                                    FeedView.currentFeed.append(NBAComplex())
//                                }
//                                else{
//
//                                    FeedView.currentFeed.append(NBASimple())
//                                }
//                                print("Added to current Feed!")
//                            })
//                            .simultaneousGesture(TapGesture().onEnded {
//                                self.isClicked.toggle()
//                            })
                        
  
                        NBAButton()
                        NFLButton()
                        NCAAMButton()
                        CFBButton()
                        MLBButton()
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
                
    
            
        } else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




struct ToggleButton: View {
    @State var isClicked: Bool = false
    @State var Sport: String
    @State var sportType: Any = EmptyView()
    //SPORT KEY:
    //0 = NBA
    //1 = NCAAM
    //2 = NFL
    //3 = CFB
    //4 = Baseball
    //5 = Soccer
    var body: some View {
        Button(action: {
            // Your auth logic
        }) {
            if(isClicked && Sport == "NBA"){
                NBAComplex()
            }else{
                NBASimple()
            }
//        switch Sport {
//            case "NBA":
//                if(isClicked){
//                    self.sportType = NBAComplex()
//                    NBAComplex()
//                }
//                else{
//                    NBASimple()
//                }
//            case "NCAAM":
//                if(isClicked){
//                    NCAAMComplex()
//                }
//                else{
//                    NCAAMSimple()
//                }
//            case "NFL":
//                if(isClicked){
//                    NFLComplex()
//                }
//                else{
//                    NFLSimple()
//                }
//            case "CFB":
//                if(isClicked){
//                    CFBComplex()
//                }
//                else{
//                    CFBSimple()
//                }
//            case "MLB":
//                if(isClicked){
//                    MLBComplex()
//                }
//                else{
//                    MLBSimple()
//                }
//            case "Soccer":
//                if(isClicked){
//                    SoccerComplex()
//                }
//                else{
//                    SoccerSimple()
//                }
//            default:
//                Text("Invalid Sport")
//            }
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                
                
                FeedView.currentFeed.append(sportType)
            }
            else{
                
                FeedView.currentFeed.append(NBASimple())
            }
            print("Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
        })
//        .simultaneousGesture(LongPressGesture().onEnded { _ in
//            print("Secret Long Press Action!")
//        })
//        .simultaneousGesture(TapGesture().onEnded {
//            print("Boring regular tap")
//        })
    }
}

struct TapAndLongPressModifier: ViewModifier {
  @State private var isLongPressing = false
  let tapAction: (()->())
  let longPressAction: (()->())
  func body(content: Content) -> some View {
    content
      .scaleEffect(isLongPressing ? 0.95 : 1.0)
      .onLongPressGesture(minimumDuration: 1.0, pressing: { (isPressing) in
        withAnimation {
          isLongPressing = isPressing
          print(isPressing)
        }
      }, perform: {
        longPressAction()
      })
      .simultaneousGesture(
        TapGesture()
          .onEnded { _ in
            tapAction()
          }
      )
  }
}
