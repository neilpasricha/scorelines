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
    @State private var team1Name: String = "Ravens"
    @State private var team2Name: String = "Steelers"
    @State private var current_possession: String = "Steelers"
    
    @State private var team1Score: Int = 17
    @State private var team2Score: Int = 7
    
    @State private var quarter: Int = 2
    @State private var gameClock: String = "8:32"
    
    @State private var team1W: Int = 7
    @State private var team1L: Int = 2
    @State private var team2W: Int = 3
    @State private var team2L: Int = 6
    
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
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            .padding(.leading, -UIScreen.main.bounds.width*0.06)
                    }
                    else{
                    Text(team1Name)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    }
                    
                    Text(" (")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team1W))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text("-")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team1L))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(")")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
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
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            .padding(.leading, -UIScreen.main.bounds.width*0.06)
                    }
                    else{
                    Text(team2Name)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    }
                    Text(" (")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team2W))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text("-")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team2L))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(")")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    }
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text(String(team1Score))
                    .lineLimit(1)
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                Spacer()
                Text(String(team2Score))
                    .lineLimit(1)
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.025))
            Spacer()
            VStack{
                Spacer()
            Text("Q" + String(quarter))
                .font(.system(size: UIScreen.main.bounds.height*0.025))
                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
            
                Spacer()
                Text(gameClock)
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
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
    
