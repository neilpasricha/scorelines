//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//
//SPORT KEY:
//0 = NBA
//1 = NCAAM
//2 = NFL
//3 = CFB
//4 = Baseball
//5 = Soccer
import SwiftUI

struct FeedView: View {
    let categories = ["Deals":1, "Happy Hour":2, "Recreation":3, "What's Happening?":4, "Misc":5]

    @State private var showSortSheet: Bool = false
    @State private var showSubmitPost: Bool = false
    @State private var showCreateUser: Bool = false
    @State private var post_content: String = ""
    @State private var isMenu: Bool = false
    @State private var currCategory: String = ""
    @State private var isShowing = false
    @State private var showComplex = false
    
    
    var body: some View
    {
        //SPORT KEY:
        //0 = NBA
        //1 = NCAAM
        //2 = NFL
        //3 = CFB
        //4 = Baseball
        //5 = Soccer
            if #available(iOS 15.0, *) {
                ScrollView{
                    VStack{
                        ToggleButton(isClicked:false, Sport:"NBA")
                        ToggleButton(isClicked:false, Sport:"NFL")
                        ToggleButton(isClicked:false, Sport:"NCAAM")
                        BaseballSimple()
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
                
    
            
        } else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




struct ToggleButton: View {
    @State var isClicked: Bool
    @State var Sport: String
    //SPORT KEY:
    //0 = NBA
    //1 = NCAAM
    //2 = NFL
    //3 = CFB
    //4 = Baseball
    //5 = Soccer
    var body: some View {
        Button(action: {
            // Your auth logic
            self.isClicked.toggle()
        }) {
            if(isClicked && Sport == "NBA"){
                NBAComplex()
            }
            else if(!isClicked && Sport == "NBA"){
                NBASimple()
            }
            else if(isClicked && Sport == "NCAAM"){
                NCAAMComplex()
            }
            else if(!isClicked && Sport == "NCAAM"){
                NCAAMSimple()
            }
            else if(isClicked && Sport == "NFL"){
                NFLComplex()
            }
            else if(!isClicked && Sport == "NFL"){
                NFLSimple()
            }
//            else if(isClicked && Sport == 1){
//                NBASimple()
//            }
//            else if(isClicked && Sport == 1){
//                NBASimple()
//            }
//            else if(isClicked && Sport == 1){
//                NBASimple()
//            }
//            else if(isClicked && Sport == 1){
//                NBASimple()
//            }
//            else if(isClicked && Sport == 1){
//                NBASimple()
//            }
//            else{
//                SimpleView()
//            }
        }
    }
}
