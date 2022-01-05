//
//  NFLComplex.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct BasketballView: View {

    @State private var showNBA: Bool = true
    @State private var showNCAAM: Bool = false
    @State private var complexFrame: Bool = false
    @StateObject var feed: Feed
    
    //Below is to detect light/dark mode.
    //"if currentMode == .dark"
    //".accentColor(currentMode == .dark ? Color.green : Color.accentColor)"
    @Environment(\.colorScheme) var currentMode
    @State private var team1Name: String = "Warriors"
    @State private var team2Name: String = "Bulls"
    
    @State private var idizzle: Int  = 0
    
    @State private var id0: Int = 0
    @State private var id1: Int = 1
    @State private var id2: Int = 2
    @State private var id3: Int = 3
    @State private var id4: Int = 4
    @State private var id5: Int = 5
    @State private var id6: Int = 6
    @State private var id7: Int = 7

    @State private var gameClockMin: Int = 4
    @State private var gameClockSec: Int = 48
    @State private var gameQuarter: Int = 4

    @State private var team1W: Int = 10
    @State private var team1L: Int = 2
    @State private var team2W: Int = 8
    @State private var team2L: Int = 4

    @State private var team1ML: Int = -1200
    @State private var team1Spread: Int = -20
    @State private var team2ML: Int = 2500
    @State private var team2Spread: Int = 12

    @State private var team1Score: Int = 114
    @State private var team2Score: Int = 79

    @State private var total: Double = 210.5
    @State private var totalScore: Double = 0
    @State private var totalDiff: Double = 17.5
    
    var body: some View
    {
        
            
            
                ScrollView{
                    
                    VStack{
                        HStack{//Selector for NBA or NCAAM
                            Spacer()
                            Button(action: {
                                showNBA = true
                                showNCAAM = false
                                self.idizzle = self.feed.CurrentFeed.count
                            }
                            
                            ) {
                                if(showNBA){
                                Text("NBA")
                                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                                .frame(width:UIScreen.main.bounds.width*0.45)
                                }
                                else{
                                Text("NBA")
                                .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                                .frame(width:UIScreen.main.bounds.width*0.45)
                                }
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.45)
                            .cornerRadius(20)
                            .overlay(
                                Rectangle()
                                    .stroke(currentMode == .dark ? Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255) : Color.black, lineWidth: 2)
                                    
                            )
                            .background(currentMode == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
                            Spacer()
                            Button(action: {
                                showNCAAM = true
                                showNBA = false
                            }) {
                                if(showNCAAM){
                                Text("NCAAM")
                                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                                .frame(width:UIScreen.main.bounds.width*0.45)
                                }
                                else{
                                Text("NCAAM")
                                .foregroundColor(currentMode == .dark ? Color.white : Color.black)
                                .frame(width:UIScreen.main.bounds.width*0.45)
                                }
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.45)
                            .cornerRadius(20)
                            .overlay(
                                Rectangle()
                                    .stroke(currentMode == .dark ? Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255) : Color.black, lineWidth: 2)
                                    
                            )
                            .background(currentMode == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width*0.95, alignment: Alignment.center)
                        .font(.system(size: 24.0))
                        .padding(.bottom)
                        if(showNBA){
                            //NBAButton(feed:feed)
                            
                            
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $idizzle, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame,id: $idizzle, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed,complexFrame: $complexFrame, id: $idizzle, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $id3, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $id4, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $id5, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $id6, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                            NBAButton(feed:feed, complexFrame: $complexFrame, id: $id7, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
                        }
                        else if(showNCAAM){
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                            NCAAMButton(feed:feed)
                        }
                        else{
                            Text("college baby")
                        }
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
            
    

            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}


