//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct CFBButton: View {
    @State var isClicked: Bool = false
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
                FeedView.currentFeed.append(CFBComplex())
            }
            else{
                FeedView.currentFeed.append(CFBSimple())
            }
            print("CFB Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("CFB Tapped!")
        })

    }
}

