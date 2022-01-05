//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct CFBButton: View {
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
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(CFBButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(CFBButton(feed:feed)))
            }
            print("CFB Added to current Feed!")
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("CFB Tapped!")
        })

    }
}

