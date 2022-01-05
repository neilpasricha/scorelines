import SwiftUI
struct NBAButton: View {
    @State var isClicked: Bool = false
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                NBAComplex()
            }else{
                NBASimple()
            }
        }
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.5).onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed)))
            }
            print(self.feed.CurrentFeed.count)
            print("NBA Added to current Feed!")
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NBA Tapped!")
        })
        

    }
}

