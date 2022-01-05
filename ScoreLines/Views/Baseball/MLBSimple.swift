import SwiftUI

struct MLBSimple: View
{
//vstack
    //{hstack
        //{hstack
            //{vstack
                //{hstack
                    //vstack
    @State private var team1Name: String = "Giants"
    @State private var team2Name: String = "Astros"
    @State private var current_possession: String = "Giants"
    
    @State private var team1Score: Int = 5
    @State private var team2Score: Int = 3
    
    @State private var inning: Int = 7
    @State private var outs: Int = 2
    
    @State private var team1W: Int = 19
    @State private var team1L: Int = 11
    @State private var team2W: Int = 27
    @State private var team2L: Int = 3
    
    var body: some View
    {
        HStack{
            Spacer()
            VStack{//Team names/scores
                Spacer()
                HStack(spacing:0){//First team name/team record
                    if(current_possession==team1Name){
                        Image("baseball")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.04)
                        
                        Text(team1Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                            .padding(.leading, -UIScreen.main.bounds.width*0.04)
                    }
                    else{
                    Text(team1Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    }
                    
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
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
                HStack(spacing:0){//Second team name/team record
                    if(current_possession==team2Name){
                        Image("baseball")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                            .rotationEffect(.degrees(-90))
                            .offset(x:-UIScreen.main.bounds.width*0.04)
                        
                        Text(team2Name)
                            .lineLimit(1)
                              .foregroundColor(Color.black)
                            .padding(.leading, -UIScreen.main.bounds.width*0.04)
                    }
                    else{
                    Text(team2Name)
                        .lineLimit(1)
                          .foregroundColor(Color.black)
                    }
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
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text(String(team1Score))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Spacer()
                Text(String(team2Score))
                    .lineLimit(1)
                      .foregroundColor(Color.black)
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.025))
            Spacer()
            VStack{
                Spacer()
            HStack(spacing: UIScreen.main.bounds.width * 0.0075){
            Image(systemName: "arrow.triangle.merge")
                    .resizable()
                
                  .foregroundColor(Color.black)
                .frame(width: UIScreen.main.bounds.width * 0.03 , height: UIScreen.main.bounds.height * 0.02)
            Text(String(inning) + "th")
                .font(.system(size: UIScreen.main.bounds.height*0.025))
                  .foregroundColor(Color.black)
            }
                Spacer()
                Text(String(outs) + " Outs")
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                      .foregroundColor(Color.black)
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
    
