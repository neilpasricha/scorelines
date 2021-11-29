//
//  FeedView.swift
//  Localist
//
//  Created by Steven Tran on 9/26/20.
//  Copyright © 2020 Localist. All rights reserved.
//

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
                }
                .padding(.top, 2)
                .padding(.bottom, 2)
                .frame(width:UIScreen.main.bounds.width)
                
                .background(.teal)
    
            
        } else {
            // Fallback on earlier versions
        }
            
        
//        let self.category_global.currCategory = category //issue here
    }
    
}




