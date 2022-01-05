//
//  MLBComplex.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct MLBComplex: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
    @State private var team1Name: String = "Giants"
    @State private var team2Name: String = "Astros"
    @State private var current_possession: String = "Giants"
    
    @State private var gameClockMin: Int = 8
    @State private var gameClockSec: Int = 32
    @State private var gameQuarter: Int = 2
    
    @State private var inning: Int = 7
    @State private var outs: Int = 2
    
    @State private var team1W: Int = 19
    @State private var team1L: Int = 11
    @State private var team2W: Int = 27
    @State private var team2L: Int = 3
    
    @State private var team1ML: Int = -450
    @State private var team1Spread: Int = -10
    @State private var team2ML: Int = 300
    @State private var team2Spread: Int = 12
    
    @State private var team1Score: Int = 5
    @State private var team2Score: Int = 3
    
    @State private var total: Double = 8
    @State private var totalScore: Double = 0
    @State private var totalDiff: Double = 0
    //Both teams total projection formula:
    //(Total_Current_Score_Both_Teams/Total_Seconds_played)*Total_Seconds_In_Entire_Game
    //(String(format:" [%.2f" ,Float(Float((Float(team1Score+team2Score))/1288))*3600)+"]")
    
    @State private var team1I1: Int = 0
    @State private var team1I2: Int = 1
    @State private var team1I3: Int = 0
    @State private var team1I4: Int = 0
    @State private var team1I5: Int = 0
    @State private var team1I6: Int = 2
    @State private var team1I7: Int = 2
    @State private var team1I8: Int = 0
    @State private var team1I9: Int = 0
    
    @State private var team2I1: Int = 0
    @State private var team2I2: Int = 0
    @State private var team2I3: Int = 2
    @State private var team2I4: Int = 1
    @State private var team2I5: Int = 0
    @State private var team2I6: Int = 0
    @State private var team2I7: Int = 0
    @State private var team2I8: Int = 0
    @State private var team2I9: Int = 0
    
    /*
     VStack(HStack(top_level, ML/Spread), HStack(VStack(team_names),VStack(innings/scores),Vstack(Totals)),HStack(lower_level, ML/Spread))
     */
    var body: some View
    {
        VStack{//Entire Frame
            HStack{//Top Level
                Spacer()
                Text("ML -275")
                Spacer()
                Text("Spread -2")
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.02))
            .foregroundColor(Color.black)
            Spacer()
            HStack{//Middle of VStacks
                VStack{//Team Names
                    
                    HStack(spacing:0){//Team1Name and Record
                        Text(team1Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team1W))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text("-")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team1L))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(")")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        }
                        .font(.system(size: UIScreen.main.bounds.height*0.02))
                    Spacer()
                    HStack(spacing:0){//Team2Name and Record
                        Text(team2Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2W))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text("-")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2L))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(")")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        }
                        .font(.system(size: UIScreen.main.bounds.height*0.02))
                }
                Spacer()
                VStack{//Inning/Scores
                    HStack{//Team1Scores
                    Text(String(team1I1))
                    Text(String(team1I2))
                    Text(String(team1I3))
                    Text(String(team1I4))
                    Text(String(team1I5))
                    Text(String(team1I6))
                    Text(String(team1I7))
                    Text(String(team1I8))
                    Text(String(team1I9))
                    }
                    Spacer()
                    HStack{//Innings
                    Text("1")
                    Text("2")
                    Text("3")
                    Text("4")
                    Text("5")
                    Text("6")
                    Text("7")
                    Text("8")
                    Text("9")
                    }
                    .padding(4)
                    .border(Color.black, width: 2)
                    
                    Spacer()
                    HStack{//Team1Scores
                    Text(String(team2I1))
                    Text(String(team2I2))
                    Text(String(team2I3))
                    Text(String(team2I4))
                    Text(String(team2I5))
                    Text(String(team2I6))
                    Text(String(team2I7))
                    Text(String(team2I8))
                    Text(String(team2I9))
                    }
                }
                .font(.system(size: UIScreen.main.bounds.height*0.02))
                .foregroundColor(Color.black)
                Spacer()
                VStack{//Totals
                    Text(String(team1Score))
                    Spacer()
                    Text(String(team1Score+team2Score))
                    Spacer()
                    Text(String(team2Score))
                }
                .font(.system(size: UIScreen.main.bounds.height*0.02))
                .foregroundColor(Color.black)
//                Spacer()
            }
            Spacer()
            HStack{//Lower Level
                Spacer()
                Text("ML +500")
                Spacer()
                Text("Spread +3")
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.02))
            .foregroundColor(Color.black)
        }
        .padding()
        .onAppear {
        UITableViewCell.appearance().selectionStyle = .none
     }
    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.2, alignment: .center)
        
    .background(Color.white)
    .overlay(
        Rectangle()
            .stroke(Color.black, lineWidth: 2)
    )
   .buttonStyle(PlainButtonStyle())
        
    }
    
}



//import SwiftUI
//import Request
//
//struct GameFrame: View
//{
////vstack
//    //{hstack
//        //{hstack
//            //{vstack
//                //{hstack
//                    //vstack
//    @State private var team1Name: String = "Warriors"
//    @State private var team2Name: String = "Bulls"
//
//    @State private var gameClockMin: Int = 2
//    @State private var gameClockSec: Int = 24
//    @State private var gameQuarter: Int = 4
//
//    @State private var team1W: Int = 9
//    @State private var team1L: Int = 1
//    @State private var team2W: Int = 7
//    @State private var team2L: Int = 3
//
//    @State private var team1ML: Int = -1200
//    @State private var team1Spread: Int = -20
//    @State private var team2ML: Int = 2500
//    @State private var team2Spread: Int = 12
//
//    @State private var total: Double = 210.5
//
//    var body: some View
//    {
//        ZStack{
//            VStack{
//                Spacer()
//                HStack{//HStack 1 for the team names,W/Ls, time left (first row of text)
//                    Spacer()
//                    Text(team1Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team1W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team1L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    }
//                    Spacer()
//                    VStack{//Time left and O/\U
//                    HStack(spacing:0){//HStack 3 for gameclock seconds and min
//                    Text("[Q")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameQuarter)+"]")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockMin))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(":")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockSec))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    }
//                    Spacer()
//                    Text(team2Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    Spacer()
//                    }//End HStack1
//
//                Spacer()
//
//                HStack{//Second line of text HStack
//                    Spacer()
//                    HStack(spacing:0){
//
//                    Text("(" + String(team1ML) + ") ")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    Text("(" + String(team1Spread) + ")")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                    HStack(spacing:0){//O/U
//                    Text("[O/U] ")
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    Text(String(total))
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    }
//                    Spacer()
//                    HStack(spacing:0){
//                        Text("(+" + String(team2ML) + ") ")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                        Text("(+" + String(team2Spread) + ")")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                }
//                Spacer()
//            }//End middle block of HStack
//            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height / 15.8)
//            .padding(.bottom)
//            .padding(.top)
//
//
//
//
//    }.onAppear {
//        UITableViewCell.appearance().selectionStyle = .none
//     }
//    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height*0.33, alignment: .center)
//    .background(Color.white)
//    .cornerRadius(20)
//    .overlay(
//        RoundedRectangle(cornerRadius: 20)
//            .stroke(Color.white, lineWidth: 2)
//    )
//   .buttonStyle(PlainButtonStyle())
//
//    }
//
//}



//                    VStack{//Time left and O/\U
//                    HStack(spacing:0){//HStack 3 for gameclock seconds and min
//                    Text("[Q")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameQuarter)+"]")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockMin))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(":")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockSec))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    }
//                    Spacer()
//                    Text(team2Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    Spacer()
//
//                Spacer()
//
//                HStack{//Second line of text HStack
//                    Spacer()
//                    HStack(spacing:0){
//
//                    Text("(" + String(team1ML) + ") ")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    Text("(" + String(team1Spread) + ")")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                    HStack(spacing:0){//O/U
//                    Text("[O/U] ")
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    Text(String(total))
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    }
//                    Spacer()
//                    HStack(spacing:0){
//                        Text("(+" + String(team2ML) + ") ")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                        Text("(+" + String(team2Spread) + ")")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                    }
