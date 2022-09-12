import SwiftUI
struct NCAAMButton: View {
    @ObservedObject var feed: Feed

    @State var isClicked: Bool = false
    @Binding var complexFrame: Bool
    var current_possession: String
    @ObservedObject var basketballData = readBasketballData()
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
        Print("readBasketballData.NCAAMComplexModel NCAAMButton")
       // Print(readBasketballData.NCAAMComplexModel)
        let nbaData = basketballData.basketballData[0].data[0]
        let ncaamData = basketballData.basketballData[0].data[1]
        let id = basketballData.basketballData[0].data[1].id
        Button(action: {
            print("$id:")
            print(ncaamData.id)
        }) {

            if(isClicked){
                NCAAMComplex(id: self.id, current_possession: ncaamData.current_possession, team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L, team1ML : ncaamData.team1ML, team1Spread : ncaamData.team1Spread, team2ML : ncaamData.team2ML, team2Spread : ncaamData.team2Spread, total : ncaamData.total, totalScore : ncaamData.totalScore, totalDiff : ncaamData.totalDiff, team1Q1: ncaamData.team1Q1,team1Q2: ncaamData.team1Q2,team1Q3: ncaamData.team1Q3,team1Q4: ncaamData.team1Q4,team2Q1: ncaamData.team2Q1,team2Q2: ncaamData.team2Q2,team2Q3: ncaamData.team2Q3,team2Q4: ncaamData.team2Q4)
            }else{
                NCAAMSimple(id: self.id, current_possession: ncaamData.current_possession, team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L)
            }
        }
        .contextMenu{
            Button {
                self.feedID = self.feed.CurrentFeed.count
                print("self.id")
                print(self.id)
                if(!self.feed.feedIDs.contains(self.id)){
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed, complexFrame: $complexFrame, current_possession: ncaamData.current_possession, id: self.id, team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L, team1ML : ncaamData.team1ML, team1Spread : ncaamData.team1Spread, team2ML : ncaamData.team2ML, team2Spread : ncaamData.team2Spread, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, total : ncaamData.total, totalScore : ncaamData.totalScore, totalDiff : ncaamData.totalDiff,team1Q1: ncaamData.team1Q1,team1Q2: ncaamData.team1Q2,team1Q3: ncaamData.team1Q3,team1Q4: ncaamData.team1Q4,team2Q1: ncaamData.team2Q1,team2Q2: ncaamData.team2Q2,team2Q3: ncaamData.team2Q3,team2Q4: ncaamData.team2Q4)))
                        //Append the ID to the feed array for easy look up
                        self.feed.feedIDs.append(self.id)
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView(NCAAMButton(feed:feed, complexFrame: $complexFrame, current_possession: ncaamData.current_possession, id: self.id,team1Name: ncaamData.homeTeam, team2Name: ncaamData.awayTeam, gameClockMin : ncaamData.gameClockMin, gameClockSec : ncaamData.gameClockSec, gameQuarter : ncaamData.gameQuarter, team1W : ncaamData.team1W, team1L : ncaamData.team1L, team2W : ncaamData.team2W, team2L : ncaamData.team2L, team1ML : ncaamData.team1ML, team1Spread : ncaamData.team1Spread, team2ML : ncaamData.team2ML, team2Spread : ncaamData.team2Spread, team1Score : ncaamData.team1Score, team2Score : ncaamData.team2Score, total : ncaamData.total, totalScore : ncaamData.totalScore, totalDiff : ncaamData.totalDiff,team1Q1: ncaamData.team1Q1,team1Q2: ncaamData.team1Q2,team1Q3: ncaamData.team1Q3,team1Q4: ncaamData.team1Q4,team2Q1: ncaamData.team2Q1,team2Q2: ncaamData.team2Q2,team2Q3: ncaamData.team2Q3,team2Q4: ncaamData.team2Q4)))
                        
                        self.feed.feedIDs.append(self.id)
                        }
                    print(self.feed.CurrentFeed.count)
                    print("NCAAM Added to current Feed!")
                }
                else{
                    if let index = self.feed.feedIDs.firstIndex(of: self.id) {
                        self.feed.CurrentFeed.remove(at: index)
                        self.feed.feedIDs.remove(at: index)
                    }
                    print(self.feed.CurrentFeed.count)
                    print("NCAAM Frame Removed from feed!")
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
            print("NCAAM Tapped!")
        })
        

    }
}

