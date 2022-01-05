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
    @StateObject var feed: Feed
    //Below is to detect light/dark mode.
    //"if currentMode == .dark"
    //".accentColor(currentMode == .dark ? Color.green : Color.accentColor)"
    @Environment(\.colorScheme) var currentMode
    var body: some View
    {
        
            
            
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
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
                            NBAButton(feed:feed)
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


