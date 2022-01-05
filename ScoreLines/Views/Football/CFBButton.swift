//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct CFBButton: View {
    @State private var addToFeedAlert = false
    @State var isClicked: Bool = false
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                CFBComplex()
            }else{
                CFBSimple()
            }
        }
        .alert(isPresented:$addToFeedAlert) {
            Alert(
                title: Text("Do you want to add this game to your feed?"),
                primaryButton: .default(Text("Add")) {
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView(CFBButton(feed:feed)))
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView(NFLButton(feed:feed)))
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
            print("CFB Tapped!")
        })

    }
}

