import SwiftUI
struct NBAButton: View {
    @ObservedObject var feed: Feed

    @State var isClicked: Bool = false
    @Binding var complexFrame: Bool
    var current_possession: String
    @ObservedObject var jsonData = readJSONData()
    let id: UUID

    @State private var feedID: Int =  0

    var team1Name: String
    var team2Name: String

    var gameClockMin: Int
    var gameClockSec: Int
    var gameQuarter: Int

    var team1W: Int
    var team1L: Int
    var team2W: Int
    var team2L: Int

    var team1ML: Int
    var team1Spread: Int
    var team2ML: Int
    var team2Spread: Int

    var team1Score: Int
    var team2Score: Int

    var total: Double
    var totalScore: Double
    var totalDiff: Double

    var team1Q1: Int
    var team1Q2: Int
    var team1Q3: Int
    var team1Q4: Int
    var team2Q1: Int
    var team2Q2: Int
    var team2Q3: Int
    var team2Q4: Int
//        @State private var team1Name: String = "Warriors"
//        @State private var team2Name: String = "Bulls"
//
//        @State private var gameClockMin: Int = 4
//        @State private var gameClockSec: Int = 48
//        @State private var gameQuarter: Int = 4
//
//        @State private var team1W: Int = 10
//        @State private var team1L: Int = 2
//        @State private var team2W: Int = 8
//        @State private var team2L: Int = 4
//
//        @State private var team1ML: Int = -1200
//        @State private var team1Spread: Int = -20
//        @State private var team2ML: Int = 2500
//        @State private var team2Spread: Int = 12
//
//        @State private var team1Score: Int = 114
//        @State private var team2Score: Int = 79
//
//        @State private var total: Double = 210.5
//        @State private var totalScore: Double = 0
//        @State private var totalDiff: Double = 17.5
    var body: some View {
        Print("jsonData.nbaComplexModel NBAButton")
       // Print(jsonData.nbaComplexModel)
        let nbaData = jsonData.nbaComplexModel[0].data[0]
        let ncaamData = jsonData.nbaComplexModel[0].data[1]
        let id = jsonData.nbaComplexModel[0].data[1].id
        Button(action: {
            print("$id:")
            print(nbaData.id)
        }) {

            if(isClicked){
                NBAComplex(id: self.id, current_possession: nbaData.current_possession, team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L, team1ML : nbaData.team1ML, team1Spread : nbaData.team1Spread, team2ML : nbaData.team2ML, team2Spread : nbaData.team2Spread, total : nbaData.total, totalScore : nbaData.totalScore, totalDiff : nbaData.totalDiff, team1Q1: nbaData.team1Q1,team1Q2: nbaData.team1Q2,team1Q3: nbaData.team1Q3,team1Q4: nbaData.team1Q4,team2Q1: nbaData.team2Q1,team2Q2: nbaData.team2Q2,team2Q3: nbaData.team2Q3,team2Q4: nbaData.team2Q4)
            }else{
                NBASimple(id: self.id, current_possession: nbaData.current_possession, team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L)
            }
        }
        .contextMenu{
            Button {
                self.feedID = self.feed.CurrentFeed.count
                print("self.id")
                print(self.id)
                if(!self.feed.feedIDs.contains(self.id)){
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed, complexFrame: $complexFrame, current_possession: jsonData.nbaComplexModel[0].data[0].current_possession, id: self.id, team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L, team1ML : nbaData.team1ML, team1Spread : nbaData.team1Spread, team2ML : nbaData.team2ML, team2Spread : nbaData.team2Spread, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, total : nbaData.total, totalScore : nbaData.totalScore, totalDiff : nbaData.totalDiff,team1Q1: nbaData.team1Q1,team1Q2: nbaData.team1Q2,team1Q3: nbaData.team1Q3,team1Q4: nbaData.team1Q4,team2Q1: nbaData.team2Q1,team2Q2: nbaData.team2Q2,team2Q3: nbaData.team2Q3,team2Q4: nbaData.team2Q4)))
                        //Append the ID to the feed array for easy look up
                        self.feed.feedIDs.append(self.id)
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView(NBAButton(feed:feed, complexFrame: $complexFrame, current_possession: jsonData.nbaComplexModel[0].data[0].current_possession, id: self.id,team1Name: nbaData.homeTeam, team2Name: nbaData.awayTeam, gameClockMin : nbaData.gameClockMin, gameClockSec : nbaData.gameClockSec, gameQuarter : nbaData.gameQuarter, team1W : nbaData.team1W, team1L : nbaData.team1L, team2W : nbaData.team2W, team2L : nbaData.team2L, team1ML : nbaData.team1ML, team1Spread : nbaData.team1Spread, team2ML : nbaData.team2ML, team2Spread : nbaData.team2Spread, team1Score : nbaData.team1Score, team2Score : nbaData.team2Score, total : nbaData.total, totalScore : nbaData.totalScore, totalDiff : nbaData.totalDiff,team1Q1: nbaData.team1Q1,team1Q2: nbaData.team1Q2,team1Q3: nbaData.team1Q3,team1Q4: nbaData.team1Q4,team2Q1: nbaData.team2Q1,team2Q2: nbaData.team2Q2,team2Q3: nbaData.team2Q3,team2Q4: nbaData.team2Q4)))
                        
                        self.feed.feedIDs.append(self.id)
                        }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Added to current Feed!")
                }
                else{
                    if let index = self.feed.feedIDs.firstIndex(of: self.id) {
                        self.feed.CurrentFeed.remove(at: index)
                        self.feed.feedIDs.remove(at: index)
                    }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Frame Removed from feed!")
                }

            } label: {
                if(!self.feed.feedIDs.contains(self.id)){
                Label("Add to Feed", systemImage: "house")
                }
                else{
                    Label("Remove from Feed", systemImage: "house.fill")
                }
            }

            Button {
                print("Add betting baby")
            } label: {
                Label("Add bets", systemImage: "banknote")
            }
        }
        .highPriorityGesture(TapGesture().onEnded {
            self.isClicked.toggle()
            self.complexFrame.toggle()
            print("tapgesture self.id")
            print(self.id)
            print("NBA Tapped!")
        })
        

    }
}

