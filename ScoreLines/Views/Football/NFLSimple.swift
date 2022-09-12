//
//  NFLSimple.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct NFLSimple: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
    let id: UUID
    
    var current_possession: String
    
     var team1Name: String
     var team2Name: String

    
     var team1Score: Int
     var team2Score: Int
    
     var gameClockMin: Int
     var gameClockSec: Int
     var gameQuarter: Int
    
    
    var team1W: Int
    var team1L: Int
    var team2W: Int
    var team2L: Int
    
    var body: some View
    {
        HStack{
            Spacer()
            VStack{//Team names/scores
                Spacer()
                HStack(spacing:0){//First team name/team record
                    if(current_possession==team1Name){
                        Image("football")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.06, height: UIScreen.main.bounds.height*0.025)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.06)
                        
                        Text(team1Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                            .padding(.leading, -UIScreen.main.bounds.width*0.06)
                    }
                    else{
                    Text(team1Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    }
                    
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
                HStack(spacing:0){//Second team name/team record
                    if(current_possession==team2Name){
                        Image("football")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.06, height: UIScreen.main.bounds.height*0.025)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.06)
                        
                        Text(team2Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                            .padding(.leading, -UIScreen.main.bounds.width*0.06)
                    }
                    else{
                    Text(team2Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    }
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
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text(String(team1Score))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Spacer()
                Text(String(team2Score))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.025))
            Spacer()
            VStack{
                Spacer()
            Text("Q" + String(gameQuarter))
                .font(.system(size: UIScreen.main.bounds.height*0.025))
            
                Spacer()
                HStack(spacing:0){
                Text(String(gameClockMin))
                        .font(.system(size: UIScreen.main.bounds.height*0.025))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Text(":")
                        .font(.system(size: UIScreen.main.bounds.height*0.025))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Text(String(gameClockSec))
                        .font(.system(size: UIScreen.main.bounds.height*0.025))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                }
                Spacer()
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.1, alignment: .center)
            
        .background(Color.white)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        )
       .buttonStyle(PlainButtonStyle())
    }
}
    
