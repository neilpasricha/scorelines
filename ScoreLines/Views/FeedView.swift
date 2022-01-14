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
    @ObservedObject var feed: Feed
    
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
        if(feed.CurrentFeed.count>0){
            ScrollView{
                VStack{
                    ForEach(0..<feed.CurrentFeed.count, id: \.self){ index in
                        feed.CurrentFeed[index]
                    }
                }
            }
            .frame(width:UIScreen.main.bounds.width)
            .padding()
            .onTapGesture(perform: {
            print(feed.CurrentFeed.count)})
        }
        else{
            VStack{
            Text("Your feed is empty.\nAdd games to your feed by holding down on their scoreboard!")
                .font(.system(size:24))
                .multilineTextAlignment(.center)
                .padding()
                Spacer()
        }
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
}
