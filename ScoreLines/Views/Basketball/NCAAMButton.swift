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
    @ObservedObject var jsonData = readJSONData()
    var body: some View {
        let ncaamData = jsonData.basketballData[0].data[1]
        Button(action: {
        }) {
            if(isClicked){
                NCAAMComplex(id: ncaamData.id, current_possession: ncaamData.current_possession, team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L, team1ML : ncaamData.team1ML, team1Spread : ncaamData.team1Spread, team2ML : ncaamData.team2ML, team2Spread : ncaamData.team2Spread, total : ncaamData.total, totalScore : ncaamData.totalScore, totalDiff : ncaamData.totalDiff, team1Q1: ncaamData.team1Q1,team1Q2: ncaamData.team1Q2,team1Q3: ncaamData.team1Q3,team1Q4: ncaamData.team1Q4,team2Q1: ncaamData.team2Q1,team2Q2: ncaamData.team2Q2,team2Q3: ncaamData.team2Q3,team2Q4: ncaamData.team2Q4)
            }else{
                NCAAMSimple(id: ncaamData.id, current_possession: ncaamData.current_possession, team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L)
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

