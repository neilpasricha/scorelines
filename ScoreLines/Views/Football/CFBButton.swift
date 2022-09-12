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
    @ObservedObject var footballData = readFootballData()
    let id: UUID

    @State private var feedID: Int =  0

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
        let CFBData = footballData.footballData[0].data[0]
        let cfbData = footballData.footballData[0].data[1]
        let id = footballData.footballData[0].data[1].id
        Button(action: {
        }) {
            if(isClicked){
                CFBComplex(id: self.id, current_possession: cfbData.current_possession, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff, team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4)
            }else{
                CFBSimple(id: self.id, current_possession: cfbData.current_possession, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L)
            }
        }
        .contextMenu{
            Button {
                if(isClicked){
                    self.feed.CurrentFeed.append(AnyView((CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: CFBData.current_possession, id: CFBData.id, team1Name: CFBData.homeTeam, team2Name: CFBData.awayTeam, gameClockMin : CFBData.gameClockMin, gameClockSec : CFBData.gameClockSec, gameQuarter : CFBData.gameQuarter, team1W : CFBData.team1W, team1L : CFBData.team1L, team2W : CFBData.team2W, team2L : CFBData.team2L, team1ML : CFBData.team1ML, team1Spread : CFBData.team1Spread, team2ML : CFBData.team2ML, team2Spread : CFBData.team2Spread, team1Score : CFBData.team1Score, team2Score : CFBData.team2Score, total : CFBData.total, totalScore : CFBData.totalScore, totalDiff : CFBData.totalDiff,team1Q1: CFBData.team1Q1,team1Q2: CFBData.team1Q2,team1Q3: CFBData.team1Q3,team1Q4: CFBData.team1Q4,team2Q1: CFBData.team2Q1,team2Q2: CFBData.team2Q2,team2Q3: CFBData.team2Q3,team2Q4: CFBData.team2Q4))))
                }
                else{
                    self.feed.CurrentFeed.append(AnyView((CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: CFBData.current_possession, id: CFBData.id, team1Name: CFBData.homeTeam, team2Name: CFBData.awayTeam, gameClockMin : CFBData.gameClockMin, gameClockSec : CFBData.gameClockSec, gameQuarter : CFBData.gameQuarter, team1W : CFBData.team1W, team1L : CFBData.team1L, team2W : CFBData.team2W, team2L : CFBData.team2L, team1ML : CFBData.team1ML, team1Spread : CFBData.team1Spread, team2ML : CFBData.team2ML, team2Spread : CFBData.team2Spread, team1Score : CFBData.team1Score, team2Score : CFBData.team2Score, total : CFBData.total, totalScore : CFBData.totalScore, totalDiff : CFBData.totalDiff,team1Q1: CFBData.team1Q1,team1Q2: CFBData.team1Q2,team1Q3: CFBData.team1Q3,team1Q4: CFBData.team1Q4,team2Q1: CFBData.team2Q1,team2Q2: CFBData.team2Q2,team2Q3: CFBData.team2Q3,team2Q4: CFBData.team2Q4))))
                }
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

