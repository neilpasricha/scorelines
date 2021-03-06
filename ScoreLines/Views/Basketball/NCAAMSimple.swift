import SwiftUI

struct NCAAMSimple: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
    @Environment(\.colorScheme) var currentMode
    @State private var id: Int = 1
    @State private var team1Name: String = "Gonzaga"
    @State private var team2Name: String = "Purdue"
    @State private var current_possession: String = "Purdue"
    
    @State private var team1Score: Int = 57
    @State private var team2Score: Int = 39
    
    @State private var quarter: Int = 4
    @State private var gameClock: String = "2:24"
    
    @State private var team1W: Int = 9
    @State private var team1L: Int = 1
    @State private var team2W: Int = 7
    @State private var team2L: Int = 3
    
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
                            .foregroundColor(Color.orange)
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
            Text("Q" + String(quarter))
                .font(.system(size: UIScreen.main.bounds.height*0.025))
                  
            
                Spacer()
                Text(gameClock)
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                      
                Spacer()
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.1, alignment: .center)
        .foregroundColor(currentMode  == .dark ? Color.white : Color.black)
        .background(currentMode  == .dark ? Color(red: 87 / 255, green: 87 / 255, blue: 87 / 255) : Color.white)
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2)
        )
       .buttonStyle(PlainButtonStyle())
    }
}
    
