//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct SoccerButton: View {
    @State var isClicked: Bool = false
    //@Binding var isClicked: Bool
    @ObservedObject var feed: Feed
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                SoccerComplex()
            }else{
                SoccerSimple()
            }
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(SoccerButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(SoccerButton(feed:feed)))
            }
            print("Soccer Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("Soccer Tapped!")
        })

    }
}

