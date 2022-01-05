//
//  NCAAMButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NCAAMButton: View {
    @State var isClicked: Bool = false
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
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            if(isClicked){
                self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
            }
            else{
                self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed)))
            }
            print("NCAAM Added to current Feed!")
        })
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NCAAM Tapped!")
        })

    }
}

