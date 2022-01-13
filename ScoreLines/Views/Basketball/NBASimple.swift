import SwiftUI

struct NBASimple: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
     /*
      @Binding var id: Int = 1
      @Binding var team1Name: String = "Warriors"
      @Binding var team2Name: String = "Bulls"
      @Binding var current_possession: String = "Warriors"
      
      @Binding var team1Score: Int = 114
      @Binding var team2Score: Int = 79
      
      @Binding var quarter: Int = 4
      @Binding var gameClock: String = "4:48"
      
      @Binding var team1W: Int = 10
      @Binding var team1L: Int = 2
      @Binding var team2W: Int = 8
      @Binding var team2L: Int = 4
      */
    @Environment(\.colorScheme) var currentMode
    
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
                        Image("basketball")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.08)
                        
                        Text(team1Name)
                            .lineLimit(1)
                                
                            .padding(.leading, -UIScreen.main.bounds.width*0.04)
                    }
                    else{
                    Text(team1Name)
                        .lineLimit(1)
                            
                    }
                    
                    Text(" (")
                        .lineLimit(1)
                            
                    Text(String(team1W))
                        .lineLimit(1)
                            
                    Text("-")
                        .lineLimit(1)
                            
                    Text(String(team1L))
                        .lineLimit(1)
                            
                    Text(")")
                        .lineLimit(1)
                          
                    }
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
                HStack(spacing:0){//Second team name/team record
                    if(current_possession==team2Name){
                        Image("basketball")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.08)
                        
                        Text(team2Name)
                            .lineLimit(1)
                              
                            .padding(.leading, -UIScreen.main.bounds.width*0.04)
                    }
                    else{
                    Text(team2Name)
                        .lineLimit(1)
                          
                    }
                    Text(" (")
                        .lineLimit(1)
                          
                    Text(String(team2W))
                        .lineLimit(1)
                          
                    Text("-")
                        .lineLimit(1)
                          
                    Text(String(team2L))
                        .lineLimit(1)
                          
                    Text(")")
                        .lineLimit(1)
                          
                    }
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text(String(team1Score))
                    .lineLimit(1)
                      
                Spacer()
                Text(String(team2Score))
                    .lineLimit(1)
                      
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
        .foregroundColor(currentMode  == .dark ? Color.white : Color.black)
        .background(currentMode  == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
        //.background(Color.gray)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        )
       .buttonStyle(PlainButtonStyle())
    }
}
    
