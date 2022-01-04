//
//  NCAAMButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NCAAMButton: View {
    @State var isClicked: Bool = false
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
                FeedView.currentFeed.append(NCAAMComplex())
            }
            else{
                FeedView.currentFeed.append(NCAAMSimple())
            }
            print("NCAAM Added to current Feed!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NCAAM Tapped!")
        })

    }
}

