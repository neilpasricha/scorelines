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
                                Text("NBA")
                                
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
                                showNCAAM = true
                                showNBA = false
                            }) {
                                Text("NCAAM")
                                
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
                        if(showNBA){
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


