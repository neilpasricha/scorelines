import SwiftUI
struct MLBButton: View {
    @State var isClicked: Bool = false
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                MLBComplex()
            }else{
                MLBSimple()
            }
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
            }
            print("MLB Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("MLB Tapped!")
        })

    }
}

