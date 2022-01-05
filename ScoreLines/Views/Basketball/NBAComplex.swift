import SwiftUI

struct NBAComplex: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
    @Binding var team1Name: String
    @Binding var team2Name: String
    
    @Binding var gameClockMin: Int
    @Binding var gameClockSec: Int
    @Binding var gameQuarter: Int
    
    @Binding var team1W: Int
    @Binding var team1L: Int
    @Binding var team2W: Int
    @Binding var team2L: Int
    
    @Binding var team1ML: Int
    @Binding var team1Spread: Int
    @Binding var team2ML: Int
    @Binding var team2Spread: Int
    
    @Binding var team1Score: Int
    @Binding var team2Score: Int
    
    @Binding var total: Double
    @Binding var totalScore: Double
    @Binding var totalDiff: Double
    /*
     team1Name: "Warriors", team2Name: "Bulls", gameClockMin : 4, gameClockSec : 48, gameQuarter : 4, team1W : 10, team1L : 2, team2W : 8, team2L : 4, team1ML : -1200, team1Spread : -20, team2ML : 2500, team2Spread : 12, team1Score : 114, team2Score : 79, total : 210.5, totalScore : 0, totalDiff : 17.5
     */
//    @State private var team1Name: String = "Warriors"
//    @State private var team2Name: String = "Bulls"
//
//    @State private var gameClockMin: Int = 4
//    @State private var gameClockSec: Int = 48
//    @State private var gameQuarter: Int = 4
//
//    @State private var team1W: Int = 10
//    @State private var team1L: Int = 2
//    @State private var team2W: Int = 8
//    @State private var team2L: Int = 4
//
//    @State private var team1ML: Int = -1200
//    @State private var team1Spread: Int = -20
//    @State private var team2ML: Int = 2500
//    @State private var team2Spread: Int = 12
//
//    @State private var team1Score: Int = 114
//    @State private var team2Score: Int = 79
//
//    @State private var total: Double = 210.5
//    @State private var totalScore: Double = 0
//    @State private var totalDiff: Double = 17.5
    //Both teams total projection formula:
    //(Total_Current_Score_Both_Teams/Total_Seconds_played)*Total_Seconds_In_Entire_Game
    //(String(format:" [%.2f" ,Float(Float((Float(team1Score+team2Score))/2736))*2880)+"]")
    
    @State private var team1Q1: Int = 35
    @State private var team1Q2: Int = 28
    @State private var team1Q3: Int = 42
    @State private var team1Q4: Int = 9
    
    @State private var team2Q1: Int = 27
    @State private var team2Q2: Int = 19
    @State private var team2Q3: Int = 29
    @State private var team2Q4: Int = 4
    
    var body: some View
    {
            HStack{
                Spacer()
                VStack{//First VStack, containing team1 info
                    //UIScreen.main.bounds.height*0.2
                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
                    Text(team1Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
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
                    .font(.system(size: UIScreen.main.bounds.height*0.02))
                    Spacer()
                    Text(String(team1Score))
                        .underline()
                        .font(.system(size: UIScreen.main.bounds.height*0.05))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                    VStack(spacing:0){
                        
                    Text("ML (" + String(team1ML) + ") ")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    Text(" Spread (" + String(team1Spread) + ")")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height*0.01)
                .padding(.top, UIScreen.main.bounds.height*0.013)
                VStack{//Time left and O/\U
                    Spacer()
                   HStack(spacing:0){//HStack 3 for gameclock seconds and min

                   Text("[Q")
                       
                       .bold()
                       .lineLimit(1)
                         .foregroundColor(Color.black)
                   Text(String(gameQuarter)+"]")
                       
                       .bold()
                       .lineLimit(1)
                         .foregroundColor(Color.black)
                       Image("basketball")
                           .resizable()
                           .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                   Text("["+String(gameClockMin))
                       
                       .bold()
                       .lineLimit(1)
                         .foregroundColor(Color.black)
                   Text(":")
                       
                       .bold()
                       .lineLimit(1)
                         .foregroundColor(Color.black)
                   Text(String(gameClockSec)+"]")
                       
                       .bold()
                       .lineLimit(1)
                         .foregroundColor(Color.black)
                       }
                    
                    .font(.system(size: UIScreen.main.bounds.height*0.02))
                   .padding(.bottom, UIScreen.main.bounds.height*0.0006)
                    Spacer()
                    HStack(spacing:0){//O/U
                    Text("O/U: ")
                            .underline()
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(String(total))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(" [" + String(totalDiff) + "]")
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        }
                        .font(.system(size: UIScreen.main.bounds.height*0.0145))
                        .padding(.bottom, UIScreen.main.bounds.height*0.00025)
                    HStack(spacing:0){//O/U
                    Text("Total: ")
                            .underline()
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    Text(String(team1Score + team2Score))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        Text(String(format:" [%.1f" ,Float(Float((Float(team1Score+team2Score))/2736))*2880)+"]")
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        }
                    .font(.system(size: UIScreen.main.bounds.height*0.0145))
                    .padding(.bottom, UIScreen.main.bounds.height*0.00125)
                    VStack{
                    HStack{//Q1 scoring
                        Text(String(team1Q1))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (Q1) ")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2Q1))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                    }
                    HStack{//Q2 scoring
                        Text(String(team1Q2))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (Q2) ")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2Q2))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                    }
                    HStack{//Q3 scoring
                        Text(String(team1Q3))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (Q3) ")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2Q3))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                    }
                    HStack{//Q4 scoring
                        Text(String(team1Q4))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(" (Q4) ")
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        Text(String(team2Q4))
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                        }
                    }//End Q Scoring VStack
                    .padding(4)
                    .font(.system(size: UIScreen.main.bounds.height*0.0165))
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 2)
                    )
                    
                    .padding(.bottom, UIScreen.main.bounds.height*0.0085)

                   }
                Spacer()
                VStack{//Third VStack, containing team2 info
                    //UIScreen.main.bounds.height*0.2
                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
                    Text(team2Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
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
                    .font(.system(size: UIScreen.main.bounds.height*0.02))
                    
                    .padding(.top, UIScreen.main.bounds.height*0.013)
                    Spacer()
                    Text(String(team2Score))
                        .underline()
                        .font(.system(size: UIScreen.main.bounds.height*0.05))
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                        .padding()
                    Spacer()
                    VStack(spacing:0){
                        
                    Text("ML (+" + String(team2ML) + ") ")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    Text(" Spread (+" + String(team2Spread) + ")")
                            .bold()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .font(.system(size: UIScreen.main.bounds.height*0.0125))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                    }
                    
                    .padding(.bottom, UIScreen.main.bounds.height*0.01)
                }
                    Spacer()
                }//end whole HStack
            
            

            
            
        
        .onAppear {
        UITableViewCell.appearance().selectionStyle = .none
     }
    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height*0.2, alignment: .center)
        
    .background(Color.white)
    .overlay(
        Rectangle()
            .stroke(Color.black, lineWidth: 2)
    )
   .buttonStyle(PlainButtonStyle())
        
    }
    
}



//import SwiftUI
//import Request
//
//struct GameFrame: View
//{
////vstack
//    //{hstack
//        //{hstack
//            //{vstack
//                //{hstack
//                    //vstack
//    @State private var team1Name: String = "Warriors"
//    @State private var team2Name: String = "Bulls"
//
//    @State private var gameClockMin: Int = 2
//    @State private var gameClockSec: Int = 24
//    @State private var gameQuarter: Int = 4
//
//    @State private var team1W: Int = 9
//    @State private var team1L: Int = 1
//    @State private var team2W: Int = 7
//    @State private var team2L: Int = 3
//
//    @State private var team1ML: Int = -1200
//    @State private var team1Spread: Int = -20
//    @State private var team2ML: Int = 2500
//    @State private var team2Spread: Int = 12
//
//    @State private var total: Double = 210.5
//
//    var body: some View
//    {
//        ZStack{
//            VStack{
//                Spacer()
//                HStack{//HStack 1 for the team names,W/Ls, time left (first row of text)
//                    Spacer()
//                    Text(team1Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team1W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team1L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    }
//                    Spacer()
//                    VStack{//Time left and O/\U
//                    HStack(spacing:0){//HStack 3 for gameclock seconds and min
//                    Text("[Q")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameQuarter)+"]")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockMin))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(":")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockSec))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    }
//                    Spacer()
//                    Text(team2Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    Spacer()
//                    }//End HStack1
//
//                Spacer()
//
//                HStack{//Second line of text HStack
//                    Spacer()
//                    HStack(spacing:0){
//
//                    Text("(" + String(team1ML) + ") ")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    Text("(" + String(team1Spread) + ")")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                    HStack(spacing:0){//O/U
//                    Text("[O/U] ")
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    Text(String(total))
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    }
//                    Spacer()
//                    HStack(spacing:0){
//                        Text("(+" + String(team2ML) + ") ")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                        Text("(+" + String(team2Spread) + ")")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                }
//                Spacer()
//            }//End middle block of HStack
//            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height / 15.8)
//            .padding(.bottom)
//            .padding(.top)
//
//
//
//
//    }.onAppear {
//        UITableViewCell.appearance().selectionStyle = .none
//     }
//    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height*0.33, alignment: .center)
//    .background(Color.white)
//    .cornerRadius(20)
//    .overlay(
//        RoundedRectangle(cornerRadius: 20)
//            .stroke(Color.white, lineWidth: 2)
//    )
//   .buttonStyle(PlainButtonStyle())
//
//    }
//
//}



//                    VStack{//Time left and O/\U
//                    HStack(spacing:0){//HStack 3 for gameclock seconds and min
//                    Text("[Q")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameQuarter)+"]")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockMin))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(":")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(gameClockSec))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    }
//                    Spacer()
//                    Text(team2Name)
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    HStack(spacing:0){//HStack 2 for the team1 wins/losses
//                    Text("(")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2W))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text("-")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(String(team2L))
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                    Text(")")
//                        .font(.headline)
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                        .padding(.bottom, 3)
//                        }
//                    Spacer()
//
//                Spacer()
//
//                HStack{//Second line of text HStack
//                    Spacer()
//                    HStack(spacing:0){
//
//                    Text("(" + String(team1ML) + ") ")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    Text("(" + String(team1Spread) + ")")
//                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                        .font(.system(size: 12))
//                        .lineLimit(2)
//                        .multilineTextAlignment(.center)
//                    }
//                    Spacer()
//                    HStack(spacing:0){//O/U
//                    Text("[O/U] ")
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    Text(String(total))
//                        .font(.system(size: 12))
//                        .lineLimit(1)
//                          .foregroundColor(Color.black)
//                    }
//                    Spacer()
//                    HStack(spacing:0){
//                        Text("(+" + String(team2ML) + ") ")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                        Text("(+" + String(team2Spread) + ")")
//                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
//                            .font(.system(size: 12))
//                            .lineLimit(2)
//                            .multilineTextAlignment(.center)
//                    }
