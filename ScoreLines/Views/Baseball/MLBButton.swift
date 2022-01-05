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
        .alert(isPresented:$addToFeedAlert) {
            Alert(
                title: Text("Do you want to add this game to your feed?"),
                primaryButton: .default(Text("Add")) {
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView(MLBButton(feed:feed)))
                    }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Added to current Feed!")
                },
                secondaryButton: .cancel()
            )
        }
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.3).onEnded { _ in
            addToFeedAlert = true
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("MLB Tapped!")
        })

    }
}

