//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NFLButton: View {
    @State var isClicked: Bool = false
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
                FeedView.currentFeed.append(AnyView(NFLComplex()))
            }
            else{
                FeedView.currentFeed.append(AnyView(NFLSimple()))
            }
            print("NFL Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NFL Tapped!")
        })

    }
}

