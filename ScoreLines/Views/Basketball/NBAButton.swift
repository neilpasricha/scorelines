import SwiftUI
struct NBAButton: View {
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
                FeedView.currentFeed.append("nba_complex")
            }
            else{
                FeedView.currentFeed.append("nba_simple")
            }
            print("NBA Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NBA Tapped!")
        })

    }
}

