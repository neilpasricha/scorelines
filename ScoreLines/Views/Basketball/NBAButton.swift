import SwiftUI
struct NBAButton: View {
    @State var isClicked: Bool = false
    @State private var addToFeedAlert = false
    @ObservedObject var feed: Feed
        @State private var team1Name: String = "Warriors"
        @State private var team2Name: String = "Bulls"
    
        @State private var gameClockMin: Int = 4
        @State private var gameClockSec: Int = 48
        @State private var gameQuarter: Int = 4
    
        @State private var team1W: Int = 10
        @State private var team1L: Int = 2
        @State private var team2W: Int = 8
        @State private var team2L: Int = 4
    
        @State private var team1ML: Int = -1200
        @State private var team1Spread: Int = -20
        @State private var team2ML: Int = 2500
        @State private var team2Spread: Int = 12
    
        @State private var team1Score: Int = 114
        @State private var team2Score: Int = 79
    
        @State private var total: Double = 210.5
        @State private var totalScore: Double = 0
        @State private var totalDiff: Double = 17.5
    var body: some View {
        Button(action: {
        }) {
            if(isClicked){
                NBAComplex(team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
            }else{
                NBASimple()
            }
        }
        .contextMenu{
            Button {
                if(isClicked){
                    self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed)))
                }
                else{
                    self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed)))
                }
                print(self.feed.CurrentFeed.count)
                print("NBA Added to current Feed!")
            } label: {
                Label("Add to Feed", systemImage: "house")
            }

            Button {
                print("Enable geolocation")
            } label: {
                Label("Add bets", systemImage: "banknote")
            }
        }
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            print("NBA Tapped!")
        })
        

    }
}

