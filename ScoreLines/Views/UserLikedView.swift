import SwiftUI
import SlideOverCard

struct UserLikedView: View {
    var body: some View {
        ZStack(alignment: .top){
            LikedListView()
                .navigationBarTitle(Text("Liked Posts"), displayMode: .inline)
        }.padding(.top)
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .edgesIgnoringSafeArea(.bottom)
    }
}
