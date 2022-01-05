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
    @ObservedObject var feed: Feed
    var body: some View
    {
        
            
            
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
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
                            NFLButton(feed:feed)
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


