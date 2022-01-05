import SwiftUI
struct NBAButton: View {
    @ObservedObject var feed: Feed
    
    @State var isClicked: Bool = false
    @Binding var complexFrame: Bool
    
    
    @Binding var id: Int
    
    @State private var feedID: Int =  0
    
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
        Button(action: {
            print("$id:")
            print($id)
        }) {
            if(isClicked){
                NBAComplex(id: $id, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)
            }else{
                NBASimple()
            }
        }
        .contextMenu{
            Button {
                self.feedID = self.feed.CurrentFeed.count
                print("self.id")
                print(self.id)
                if(!self.feed.feedIDs.contains(id)){
                    if(isClicked){
                        self.feed.CurrentFeed.append(AnyView                            (NBAButton(feed:feed, complexFrame: $complexFrame, id: $id, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)))
                        //Append the ID to the feed array for easy look up
                        self.feed.feedIDs.append(id)
                    }
                    else{
                        self.feed.CurrentFeed.append(AnyView                            (NBAButton(feed:feed, complexFrame: $complexFrame, id: $id, team1Name: $team1Name, team2Name: $team2Name, gameClockMin : $gameClockMin, gameClockSec : $gameClockSec, gameQuarter : $gameQuarter, team1W : $team1W, team1L : $team1L, team2W : $team2W, team2L : $team2L, team1ML : $team1ML, team1Spread : $team1Spread, team2ML : $team2ML, team2Spread : $team2Spread, team1Score : $team1Score, team2Score : $team2Score, total : $total, totalScore : $totalScore, totalDiff : $totalDiff)))
                        
                        self.feed.feedIDs.append(id)
                        }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Added to current Feed!")
                }
                else{
                    if let index = self.feed.feedIDs.firstIndex(of: id) {
                        self.feed.CurrentFeed.remove(at: index)
                        self.feed.feedIDs.remove(at: index)
                    }
                    print(self.feed.CurrentFeed.count)
                    print("NBA Frame Removed from feed!")
                }

            } label: {
                if(!self.feed.feedIDs.contains(id)){
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

