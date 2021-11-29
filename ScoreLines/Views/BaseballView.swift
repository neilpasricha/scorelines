//
//  FeedView.swift
//  Localist
//
//  Created by Steven Tran on 9/26/20.
//  Copyright © 2020 Localist. All rights reserved.
//

import SwiftUI

struct BaseballView: View {

    @State private var showSortSheet: Bool = false
    @State private var showSubmitPost: Bool = false
    @State private var showCreateUser: Bool = false
    @State private var post_content: String = ""
    @State private var isMenu: Bool = false
    @State private var currCategory: String = ""
    @State private var isShowing = false
    
    
    var body: some View
    {
        
            
            if #available(iOS 15.0, *) {
                ScrollView{
                    VStack{
                        
                        GameFrame()
                        GameFrame()
                        GameFrame()
                        GameFrame()
                        GameFrame()
                        GameFrame()
                    }
                    
                    .frame(width:UIScreen.main.bounds.width)
                    
                    .padding(.top, 2)
                    .padding(.bottom, 2)
                }
                .navigationBarTitle(Text("Baseball"))
                }
    
    
         else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




