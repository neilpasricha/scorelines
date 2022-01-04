import SwiftUI

struct BaseballSimple: View
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
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                    }
                    Text(team1Name)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    
                    Text(" (")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team1W))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text("-")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team1L))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(")")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    }
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
                HStack(spacing:0){//Second team name/team record
                    if(current_possession==team2Name){
                        Image("baseball")
                            .resizable()
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width*0.04, height: UIScreen.main.bounds.height*0.019)
                    }
                    Text(team2Name)
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(" (")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team2W))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text("-")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(String(team2L))
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    Text(")")
                        .lineLimit(1)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    }
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                Spacer()
            }
            Spacer()
            VStack{
                Spacer()
                Text(String(team1Score))
                    .lineLimit(1)
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                Spacer()
                Text(String(team2Score))
                    .lineLimit(1)
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                Spacer()
            }
            .font(.system(size: UIScreen.main.bounds.height*0.025))
            Spacer()
            VStack{
                Spacer()
            HStack(spacing: UIScreen.main.bounds.width * 0.0075){
            Image(systemName: "arrow.triangle.merge")
                    .resizable()
                
                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                .frame(width: UIScreen.main.bounds.width * 0.03 , height: UIScreen.main.bounds.height * 0.02)
            Text(String(inning) + "th")
                .font(.system(size: UIScreen.main.bounds.height*0.025))
                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
            }
                Spacer()
                Text(String(outs) + " Outs")
                    .font(.system(size: UIScreen.main.bounds.height*0.025))
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
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
    
