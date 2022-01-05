//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//

import SwiftUI

struct BaseballView: View {
    @State var isClicked: Bool = false
    @ObservedObject var feed: Feed
    
    var body: some View
    {
        
            
            
                ScrollView{
                    VStack{
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                        MLBButton(feed:feed)
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding()
                }
                .navigationBarTitle(Text("Baseball"))
                
    

            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




