import SwiftUI
struct MLBButton: View {
    @State var isClicked: Bool = false
    @State private var addToFeedAlert = false
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
        .contextMenu{
            Button {
                if(isClicked){
                    self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
                }
                else{
                    self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
                }
                print(self.feed.CurrentFeed.count)
                print("NBA Added to current Feed!")
            } label: {
                Label("Add to Feed", systemImage: "house")
            }

            Button {
                print("Enable geolocation")
            } label: {
                Label("Add bets", systemImage: "banknote")
            }
        }
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("MLB Tapped!")
        })

    }
}

