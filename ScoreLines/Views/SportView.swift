import SwiftUI
struct SportView: View {
    @State var isClicked: Bool = false
    
    let id = UUID()
    let game: String
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                NBAComplex()
            }else{
                NBASimple()
            }
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
               // FeedView..CurrentFeed.append(AnyView(NBAComplex()))
            }
            else{
                //FeedView.feed.CurrentFeed.append(AnyView(NBASimple()))
            }
           // print(feed.CurrentFeed.count)
            print("NBA Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NBA Tapped!")
        })

    }
}

