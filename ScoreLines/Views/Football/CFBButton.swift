//
//  CFBButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct CFBButton: View {
    @ObservedObject var feed: Feed

    @State var isClicked: Bool = false
    @Binding var complexFrame: Bool
    var current_possession: String
    @State private var addToFeedAlert = false
    let id: UUID

    var team1Name: String
    var team2Name: String

    var gameClockMin: Int
    var gameClockSec: Int
    var gameQuarter: Int

    var team1W: Int
    var team1L: Int
    var team2W: Int
    var team2L: Int

    var team1ML: Int
    var team1Spread: Int
    var team2ML: Int
    var team2Spread: Int

    var team1Score: Int
    var team2Score: Int

    var total: Double
    var totalScore: Double
    var totalDiff: Double

    var team1Q1: Int
    var team1Q2: Int
    var team1Q3: Int
    var team1Q4: Int
    var team2Q1: Int
    var team2Q2: Int
    var team2Q3: Int
    var team2Q4: Int
    
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                CFBComplex(id: self.id, current_possession: current_possession, team1Name: team1Name, team2Name: team2Name, team1Score : team1Score, team2Score : team2Score, gameClockMin : gameClockMin, gameClockSec : gameClockSec, gameQuarter : gameQuarter, team1W : team1W, team1L : team1L, team2W : team2W, team2L : team2L, team1ML : team1ML, team1Spread : team1Spread, team2ML : team2ML, team2Spread : team2Spread, total : total, totalScore : totalScore, totalDiff : totalDiff, team1Q1: team1Q1,team1Q2: team1Q2,team1Q3: team1Q3,team1Q4: team1Q4,team2Q1: team2Q1,team2Q2: team2Q2,team2Q3: team2Q3,team2Q4: team2Q4)
            }else{
                CFBSimple(id: self.id, current_possession: current_possession, team1Name: team1Name, team2Name: team2Name, team1Score : team1Score, team2Score : team2Score, gameClockMin : gameClockMin, gameClockSec : gameClockSec, gameQuarter : gameQuarter, team1W : team1W, team1L : team1L, team2W : team2W, team2L : team2L)
            }
        }
        .contextMenu{
            Button {
                self.feed.append(AnyView(CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: current_possession, id: self.id, team1Name: team1Name, team2Name: team2Name, gameClockMin : gameClockMin, gameClockSec : gameClockSec, gameQuarter : gameQuarter, team1W : team1W, team1L : team1L, team2W : team2W, team2L : team2L, team1ML : team1ML, team1Spread : team1Spread, team2ML : team2ML, team2Spread : team2Spread, team1Score : team1Score, team2Score : team2Score, total : total, totalScore : totalScore, totalDiff : totalDiff,team1Q1: team1Q1,team1Q2: team1Q2,team1Q3: team1Q3,team1Q4: team1Q4,team2Q1: team2Q1,team2Q2: team2Q2,team2Q3: team2Q3,team2Q4: team2Q4)))
                print(self.feed.CurrentFeed.count)
                print("cfb Added to current Feed!")
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
            print("CFB Tapped!")
        })

    }
}
