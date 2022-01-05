//
//  NCAAMButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NCAAMButton: View {
    @State var isClicked: Bool = false
    @State private var addToFeedAlert = false
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                NCAAMComplex()
            }else{
                NCAAMSimple()
            }
        }
        .alert(isPresented:$addToFeedAlert) {
            Alert(
                title: Text("Do you want to add this game to your feed?"),
                primaryButton: .default(Text("Add")) {
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
                    }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Added to current Feed!")
                },
                secondaryButton: .cancel()
            )
        }
        .simultaneousGesture(LongPressGesture(minimumDuration: 0.1).onEnded { _ in
            addToFeedAlert = true
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NCAAM Tapped!")
        })

    }
}

