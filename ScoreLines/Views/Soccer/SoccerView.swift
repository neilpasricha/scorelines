//
//  NFLComplex.swift
//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct SoccerView: View {

    @State private var showNBA: Bool = true
    @State private var showNCAAM: Bool = false
    
    
    var body: some View
    {
        
            
            if #available(iOS 15.0, *) {
                ScrollView{
                    
                    VStack{
                        HStack{//Selector for NBA or NCAAM
                            Spacer()
                            Button(action: {
                                showNBA = true
                                showNCAAM = false
                            }
                            
                            ) {
                                Text("Premier")
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.3)
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
                                Text("LaLiga")
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.3)
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
                                Text("MLS")
                            }
                            .padding()
                            .frame(width:UIScreen.main.bounds.width*0.3)
                            .cornerRadius(20)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 2)
                            )
                            
                                   
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width*0.95, alignment: Alignment.center)
                        .font(.system(size: 24.0))
                        if(showNBA){
                            NBASimple()
                            NBASimple()
                            NBASimple()
                            NBASimple()
                            NBASimple()
                            NBASimple()
                        }
                        else if(showNCAAM){
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                        }
                        else{
                            Text("college baby")
                        }
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
                .navigationBarTitle(Text("Basketball"))
                }
    
    
         else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}


