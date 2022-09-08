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
    @ObservedObject var footballData = readFootballData()
    var body: some View
    {
        
//
//        let nflData = jsonData.footballData[0].data[0]
//        let cfbData = jsonData.footballData[0].data[1]
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
                            NFLButton(feed:feed)
                                (NFLButton(feed:feed, complexFrame: $complexFrame, current_possession: footballData.current_possession, id: footballData.id, team1Name: footballData.homeTeam, team2Name: footballData.awayTeam, gameClockMin : footballData.gameClockMin, gameClockSec : footballData.gameClockSec, gameQuarter : footballData.gameQuarter, team1W : footballData.team1W, team1L : footballData.team1L, team2W : footballData.team2W, team2L : footballData.team2L, team1ML : footballData.team1ML, team1Spread : footballData.team1Spread, team2ML : footballData.team2ML, team2Spread : footballData.team2Spread, team1Score : footballData.team1Score, team2Score : footballData.team2Score, total : footballData.total, totalScore : footballData.totalScore, totalDiff : footballData.totalDiff,team1Q1: footballData.team1Q1,team1Q2: footballData.team1Q2,team1Q3: footballData.team1Q3,team1Q4: footballData.team1Q4,team2Q1: footballData.team2Q1,team2Q2: footballData.team2Q2,team2Q3: footballData.team2Q3,team2Q4: footballData.team2Q4))
                            }
                        }
                        else if(showCFB){
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
                            CFBButton(feed:feed)
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


