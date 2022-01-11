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
    @ObservedObject var feed: Feed
    
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
                        .padding(.bottom)
                        if(showNBA){
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
                            NCAAMSimple()
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

    

        
//        let self.category_global.currCategory = category //issue here
    }
    
}


