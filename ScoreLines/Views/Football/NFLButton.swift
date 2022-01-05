//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NFLButton: View {
    @State var isClicked: Bool = false
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                NFLComplex()
            }else{
                NFLSimple()
            }
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(NFLButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(NFLButton(feed:feed)))
            }
            print("NFL Added to current Feed!")
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NFL Tapped!")
        })

    }
}

