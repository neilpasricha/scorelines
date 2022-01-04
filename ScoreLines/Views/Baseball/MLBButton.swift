import SwiftUI
struct MLBButton: View {
    @State var isClicked: Bool = false
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
                FeedView.currentFeed.append(MLBComplex())
            }
            else{
                FeedView.currentFeed.append(MLBSimple())
            }
            print("MLB Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
        })

    }
}

