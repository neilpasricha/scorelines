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
    
    @State private var total: Double = 9.5
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
     Horizontal Frame:
     VStack(HStack(top_level, ML/Spread), HStack(VStack(team_names),VStack(innings/scores),Vstack(Totals)),HStack(lower_level, ML/Spread))
     */
    
    /*
     Vertical Frame:
        HStack(VStack(Left_side_team, score,  ml, spread, player stats), VStack(O/U,Total, HStack(VStack(left_team_scores), VStack(innings), VStack(right_team_scores))), VStack(Right_side_team, score, ml, spread, player stats))
     */
    var body: some View
    {
            HStack{
                
                Spacer()
                VStack{//First VStack, containing team1 info
                    //UIScreen.main.bounds.height*0.2
                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
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
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                    
                    Spacer()
                    Text(String(team1Score))
                        .underline()
                        .font(.system(size: UIScreen.main.bounds.height*0.05))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                    VStack(spacing:0){
                        
                    Text("ML (" + String(team1ML) + ") ")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    Text(" Spread (" + String(team1Spread) + ")")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height*0.01)
                .padding(.top, UIScreen.main.bounds.height*0.013)
                VStack{//Time left and O/\U
                    Spacer()
                    Spacer()
                    HStack{
                        Spacer()
                    HStack(spacing: UIScreen.main.bounds.width * 0.0075){
                    Image(systemName: "arrow.triangle.merge")
                            .resizable()
                        
                          .foregroundColor(Color.black)
                        .frame(width: UIScreen.main.bounds.width * 0.03 , height: UIScreen.main.bounds.height * 0.02)
                    Text(String(inning) + "th")
                        .font(.system(size: UIScreen.main.bounds.height*0.025))
                          .foregroundColor(Color.black)
                    }
                        Rectangle()
                            .fill(Color.black)
                            .frame(width:2)
                        Text(String(outs) + "/O")
                            .font(.system(size: UIScreen.main.bounds.height*0.025))
                              .foregroundColor(Color.black)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.height*0.15, height: UIScreen.main.bounds.height*0.03, alignment: .center)
                    .padding(4)
                    .border(Color.black, width: 2)
                    HStack(spacing:0){//O/U
                    Text("O/U: ")
                            .underline()
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(String(total))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(" [" + String(totalDiff) + "]")
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        }
                        .font(.system(size: UIScreen.main.bounds.height*0.0145))
                        .padding(.bottom, UIScreen.main.bounds.height*0.00025)
                    HStack(spacing:0){//O/U
                    Text("Total: ")
                            .underline()
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(String(team1Score + team2Score))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        Text(String(format:" [%.1f" ,Float(Float((Float(team1Score+team2Score))/Float(inning)))*9)+"]")
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        }
                    .font(.system(size: UIScreen.main.bounds.height*0.0145))
                    .padding(.bottom, UIScreen.main.bounds.height*0.00125)
                    HStack{//Inning/Scores
                        VStack{//Team1Scores
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
                        VStack{//Innings
                            ForEach(1..<10) { i in
                            if(i==inning){
                                Text(String(inning))
                                    .underline()
                                    .bold()

                            }
                            else{
                                Text(String(i))
                                }
                            }
                        }
                        .padding(4)
                        .border(Color.black, width: 2)
                        
                        Spacer()
                        VStack{//Team2Scores
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
                    Spacer()
                }
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: UIScreen.main.bounds.height*0.020))
                    .foregroundColor(Color.black)
                Spacer()
                VStack{//Third VStack, containing team2 info
                    //UIScreen.main.bounds.height*0.2
                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
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
                    
                    .padding(.top, UIScreen.main.bounds.height*0.013)
                    Spacer()
                    Text(String(team2Score))
                        .underline()
                        .font(.system(size: UIScreen.main.bounds.height*0.05))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                    VStack(spacing:0){
                        
                    Text("ML (+" + String(team2ML) + ") ")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    Text(" Spread (+" + String(team2Spread) + ")")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    }
                    
                    .padding(.bottom, UIScreen.main.bounds.height*0.01)
                }
                    Spacer()
                }//end whole HStack
            
            

            
            
        
        .onAppear {
        UITableViewCell.appearance().selectionStyle = .none
     }
    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.4, alignment: .center)
        
    .background(Color.white)
    .overlay(
        Rectangle()
            .stroke(Color.black, lineWidth: 2)
    )
   .buttonStyle(PlainButtonStyle())
        
    }
    
}

