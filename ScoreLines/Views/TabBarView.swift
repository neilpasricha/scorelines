//
//  MenuView.swift
//  Bubble
//
//  Created by Steven Tran on 12/10/20.
//  Copyright © 2020 Bubble. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct TabBarView : View {
    @Binding var userLatitude: String
    @Binding var userLongitude: String
    
    @State private var background = BackgroundStyle.solid
    
    @EnvironmentObject var userAuth: UserAuth

    var body : some
    View{
        TabView{
            
//            UserProfileView(userLatitude: self.$userLatitude , userLongitude: self.$userLongitude)
//                .tabItem{
//                    Image(systemName: "person.fill").resizable().frame(width: 25, height: 25).padding()
//                    Text("Account").fontWeight(.heavy)
//                }
//
//            UserLikedView(userLatitude: self.$userLatitude , userLongitude: self.$userLongitude)
//                .tabItem{
//                    Image(systemName: "checkmark.rectangle.fill").resizable().frame(width: 25, height: 25).padding()
//                    Text("Liked").fontWeight(.heavy)
//                }
            
                
            }
        
    }
    func goProfile() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: UserProfileView())
            window.makeKeyAndVisible()
        }
    }
    func goLiked() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: LikedListView())
            window.makeKeyAndVisible()
        }
    }
    func goReport() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: FeedbackView())
            window.makeKeyAndVisible()
        }
    }
    func goExit() {
        userAuth.logout()
    }
}

