//
//  NFLComplex.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct FootballView: View {

    @State private var showNFL: Bool = true
    @State private var showCFB: Bool = false
    @State private var complexFrame: Bool = false
    @ObservedObject var feed: Feed
    @StateObject private var footballData = readFootballData()

    
    var body: some View
    {
//        let nbaData = basketballData.basketballData[0].data[0]
//        let ncaamData = basketballData.basketballData[0].data[1]
        let nflData = footballData.footballData[0].data[0]
        let cfbData = footballData.footballData[0].data[1]
                ScrollView{
                    
                    VStack{
                        HStack{//Selector for NBA or NCAAM
                            Spacer()
                            Button(action: {
                                showNFL = true
                                showCFB = false
                            }
                            
                            ) {
                                Text("NFL")
                                
                                .frame(width:UIScreen.main.bounds.width*0.45)
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.45)
                            .cornerRadius(20)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            Spacer()
                            Button(action: {
                                showNFL = false
                                showCFB = true
                            }) {
                                Text("CFB")
                                
                                .frame(width:UIScreen.main.bounds.width*0.45)
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.45)
                            .cornerRadius(20)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            
                                   
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width*0.95, alignment: Alignment.center)
                        .font(.system(size: 24.0))
                        .padding(.bottom)
                        if(showNFL){
                            ScrollView{
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: nflData.current_possession, id: nflData.id, team1Name: nflData.homeTeam, team2Name: nflData.awayTeam, gameClockMin : nflData.gameClockMin, gameClockSec : nflData.gameClockSec, gameQuarter : nflData.gameQuarter, team1W : nflData.team1W, team1L : nflData.team1L, team2W : nflData.team2W, team2L : nflData.team2L, team1ML : nflData.team1ML, team1Spread : nflData.team1Spread, team2ML : nflData.team2ML, team2Spread : nflData.team2Spread, team1Score : nflData.team1Score, team2Score : nflData.team2Score, total : nflData.total, totalScore : nflData.totalScore, totalDiff : nflData.totalDiff,team1Q1: nflData.team1Q1,team1Q2: nflData.team1Q2,team1Q3: nflData.team1Q3,team1Q4: nflData.team1Q4,team2Q1: nflData.team2Q1,team2Q2: nflData.team2Q2,team2Q3: nflData.team2Q3,team2Q4: nflData.team2Q4))
                            }
                        }
                        else if(showCFB){
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                            (CFBButton(feed:feed, complexFrame: $complexFrame, current_possession: cfbData.current_possession, id: cfbData.id, team1Name: cfbData.homeTeam, team2Name: cfbData.awayTeam, gameClockMin : cfbData.gameClockMin, gameClockSec : cfbData.gameClockSec, gameQuarter : cfbData.gameQuarter, team1W : cfbData.team1W, team1L : cfbData.team1L, team2W : cfbData.team2W, team2L : cfbData.team2L, team1ML : cfbData.team1ML, team1Spread : cfbData.team1Spread, team2ML : cfbData.team2ML, team2Spread : cfbData.team2Spread, team1Score : cfbData.team1Score, team2Score : cfbData.team2Score, total : cfbData.total, totalScore : cfbData.totalScore, totalDiff : cfbData.totalDiff,team1Q1: cfbData.team1Q1,team1Q2: cfbData.team1Q2,team1Q3: cfbData.team1Q3,team1Q4: cfbData.team1Q4,team2Q1: cfbData.team2Q1,team2Q2: cfbData.team2Q2,team2Q3: cfbData.team2Q3,team2Q4: cfbData.team2Q4))
                        }
                        else{
                            Text("college baby")
                        }
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
                .navigationBarTitle(Text("Football"))
                }
    
    
            
        
//        let self.category_global.currCategory = category //issue here
    
    
}

