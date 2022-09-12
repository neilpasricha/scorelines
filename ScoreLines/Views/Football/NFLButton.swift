//
//  NFLButton.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI
struct NFLButton: View {
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
        let nflData = footballData.footballData[0].data[0]
        let cfbData = footballData.footballData[0].data[1]
        let id = footballData.footballData[0].data[1].id
        Button(action: {
        }) {
            if(isClicked){
                NFLComplex(id: self.id, current_possession: nflData.current_possession, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, team1Score : nflData.team1Score, team2Score : nflData.team2Score, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff, team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4)
            }else{
                NFLSimple(id: self.id, current_possession: nflData.current_possession, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, team1Score : nflData.team1Score, team2Score : nflData.team2Score, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L)
            }
        }
        .contextMenu{
            Button {
                if(isClicked){
                    self.feed.CurrentFeed.append(AnyView((NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))))
                }
                else{
                    self.feed.CurrentFeed.append(AnyView((NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))))
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
            print("NFL Tapped!")
        })

    }
}

