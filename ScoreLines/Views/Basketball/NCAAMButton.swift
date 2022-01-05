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
        .contextMenu{
            Button {
                if(isClicked){
                    self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
                }
                else{
                    self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
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
            print("NCAAM Tapped!")
        })

    }
}

