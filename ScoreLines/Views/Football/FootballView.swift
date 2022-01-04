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
    
    
    var body: some View
    {
        
            
            if #available(iOS 15.0, *) {
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
                        if(showNFL){
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                            ToggleButton(isClicked:false, Sport:"NFL")
                        }
                        else if(showCFB){
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
                            ToggleButton(isClicked:false, Sport:"CFB")
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
    
    
         else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}


