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
    @ObservedObject var jsonData = readJSONData()
    
    //Below is to detect light/dark mode.
    //"if currentMode == .dark"
    //".accentColor(currentMode == .dark ? Color.green : Color.accentColor)"
    @Environment(\.colorScheme) var currentMode
//    @State private var team1Name: String = "Warriors"
//    @State private var team2Name: String = "Bulls"
//    @State private var current_possession: String = "Warriors"
//    @State private var idizzle: Int  = 0
//    
//    @State private var id0: Int = Int.random(in: 1..<2147483645)
//    @State private var id1: Int = Int.random(in: 1..<2147483645)
//    @State private var id2: Int = Int.random(in: 1..<2147483645)
//    @State private var id3: Int = Int.random(in: 1..<2147483645)
//    @State private var id4: Int = Int.random(in: 1..<2147483645)
//    @State private var id5: Int = Int.random(in: 1..<2147483645)
//    @State private var id6: Int = Int.random(in: 1..<2147483645)
//    @State private var id7: Int = Int.random(in: 1..<2147483645)
//
//    @State private var gameClockMin: Int = 4
//    @State private var gameClockSec: Int = 48
//    @State private var gameQuarter: Int = 4
//
//    @State private var team1W: Int = 10
//    @State private var team1L: Int = 2
//    @State private var team2W: Int = 8
//    @State private var team2L: Int = 4
//
//    @State private var team1ML: Int = -1200
//    @State private var team1Spread: Int = -20
//    @State private var team2ML: Int = 2500
//    @State private var team2Spread: Int = 12
//
//    @State private var team1Score: Int = 114
//    @State private var team2Score: Int = 79
//
//    @State private var total: Double = 210.5
//    @State private var totalScore: Double = 0
//    @State private var totalDiff: Double = 17.5
    
    var body: some View
    {
//        List(jsonData.nbaComplexModel){complex in
//           // Text(complex.team2Name)
        
        let nbaData = jsonData.nbaComplexModel[0].data[0]
        let ncaamData = jsonData.nbaComplexModel[0].data[1]
                ScrollView{

                    VStack{
                        HStack{//Selector for NBA or NCAAM
                            Spacer()
                            Button(action: {
                                showNBA = true
                                showNCAAM = false
                            }

                            ) {
                                if(showNBA){
                                Text("NBA")
                                .foregroundColor(Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255))
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
                                    .stroke(currentMode == .dark ? Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255) : Color.black, lineWidth: 2)

                            )
                            .background(currentMode == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
                            Spacer()
                            Button(action: {
                                showNCAAM = true
                                showNBA = false
                                print(jsonData.nbaComplexModel)
                            }) {
                                if(showNCAAM){
                                Text("NCAAM")
                                .foregroundColor(Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255))
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
                                    .stroke(currentMode == .dark ? Color(red: 123 / 255, green: 198 / 255, blue: 235 / 255) : Color.black, lineWidth: 2)

                            )
                            .background(currentMode == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width*0.95, alignment: Alignment.center)
                        .font(.system(size: 24.0))
                        .padding(.bottom)
                        if(showNBA){
                            //NBAButton(feed:feed)
                          //  Print(jsonData.nbaComplexModel[0].data[0])
                            (NBAButton(feed:feed, complexFrame: $complexFrame, current_possession: nbaData.current_possession,id: feed.generateIDs(), team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L, team1ML : nbaData.team1ML, team1Spread : nbaData.team1Spread, team2ML : nbaData.team2ML, team2Spread : nbaData.team2Spread, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, total : nbaData.total, totalScore : nbaData.totalScore, totalDiff : nbaData.totalDiff))
                            (NBAButton(feed:feed, complexFrame: $complexFrame, current_possession: nbaData.current_possession,id: feed.generateIDs(), team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L, team1ML : nbaData.team1ML, team1Spread : nbaData.team1Spread, team2ML : nbaData.team2ML, team2Spread : nbaData.team2Spread, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, total : nbaData.total, totalScore : nbaData.totalScore, totalDiff : nbaData.totalDiff))
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
    }
    
//    private func parseJSON(){
//        guard let path = Bundle.main.path(forResource: "NBAComplex", ofType: "json")else{
//            return
//        }
//        let url = URL(fileURLWithPath: path)
//
//    }
    
}


extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}

extension ClosedRange where Element: Hashable {
    func random(without excluded:[Element]) -> Int {
        let valid = Set(self).subtracting(Set(excluded))
        let random = Int(arc4random_uniform(UInt32(valid.count)))
        return random
    }
}
