//
//  MenuView.swift
//  Bubble
//
//  Created by Steven Tran on 12/10/20.
//  Copyright © 2020 Bubble. All rights reserved.
//

import SwiftUI
import SlideOverCard

struct MenuView : View {
    @Binding var showMenu: Bool
    
    @State private var background = BackgroundStyle.solid
    
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var categoryGlobal: Category
    
    var body : some
        
    View{
        if #available(iOS 14.0, *) {

            VStack
            {
                Image("dark_text")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.33, height: UIScreen.main.bounds.height * 0.05, alignment: .center)
                    .foregroundColor(Color("bubble_dark"))
                    .opacity(0.6)
                    .padding(.top, UIScreen.main.bounds.height * 0.15)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                    .padding(.trailing, UIScreen.main.bounds.height * 0.04)
                            
                VStack
                {
                    NavigationLink(destination: UserProfileView())
                    {
                        //Image("menu_report").resizable().frame(width: 25, height: 25).padding()
                        Text("account").foregroundColor(.white).font(.system(size: 23)).bold()
                            .padding(.leading, UIScreen.main.bounds.height * 0.015)
                        
                    }
                    Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .padding(.leading, UIScreen.main.bounds.width * 0.06)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
                .padding()
                .padding(.bottom, UIScreen.main.bounds.height * 0.005)
                .padding(.leading, UIScreen.main.bounds.height * 0.002)
                
                VStack
                {
                    NavigationLink(destination: NotificationView())
                    {
                        Text("notifications").foregroundColor(.white).font(.system(size: 23)).bold()
                            .padding(.leading, UIScreen.main.bounds.height * 0.03)
                            .padding(.top, UIScreen.main.bounds.height * 0.005)
                    }
                    Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .padding(.leading, UIScreen.main.bounds.width * 0.02)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
                .padding()
                .padding(.bottom, UIScreen.main.bounds.height * 0.005)
                .padding(.leading, UIScreen.main.bounds.height * 0.001)
                .padding(.top, UIScreen.main.bounds.height * 0.01)
//                HStack
//                {
//                    NavigationLink(destination: UserProfileView())
//                    {
//                        //Image("menu_account").resizable().frame(width: 25, height: 25).padding()
//                        Text("Account").foregroundColor(.white)
//                    }
//                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
//                .padding()
//
//                Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                
                
                VStack
                {
                    NavigationLink(destination: UserLikedView())
                    {
                        //Image("menu_report").resizable().frame(width: 25, height: 25).padding()
                        Text("liked").foregroundColor(.white)
                            .font(.system(size: 23)).bold()
                            .padding(.leading, -UIScreen.main.bounds.width * 0.05)
                            .padding(.top, UIScreen.main.bounds.height * 0.005)
                        
                    }
                    Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .padding(.leading, UIScreen.main.bounds.width * 0.06)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
                .padding()
                .padding(.bottom, UIScreen.main.bounds.height * 0.005)
                .padding(.top, UIScreen.main.bounds.height * 0.01)
                
//                HStack
//                {
//                    NavigationLink(destination: UserLikedView())
//                    {
//                        //Image("menu_likes").resizable().frame(width: 25, height: 25).padding()
//                        Text("Liked").foregroundColor(.white)
//                    }
//                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
//                .padding()
//
//                Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                
                VStack
                {
                    NavigationLink(destination: FeedbackView().environmentObject(locationViewModel))
                    {
                        //Image("menu_report").resizable().frame(width: 25, height: 25).padding()
                        Text("feedback").foregroundColor(.white).font(.system(size: 23)).bold()
                            .padding(.top, UIScreen.main.bounds.height * 0.005)
                            .padding(.leading, UIScreen.main.bounds.height * 0.025)
                        
                    }
                    Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .padding(.leading, UIScreen.main.bounds.width * 0.06)
                    
                }.frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
                .padding()
                .padding(.bottom, UIScreen.main.bounds.height * 0.005)
                .padding(.top, UIScreen.main.bounds.height * 0.01)
                
                
                
                    Button(action: goExit)
                    {
                        //Image("menu_log").resizable().frame(width: 25, height: 25).padding()
                        Text("log out").foregroundColor(.white)
                            .font(.system(size: 23)).bold()
                            .padding(.top, UIScreen.main.bounds.height * 0.005)
                            .padding(.leading, UIScreen.main.bounds.width * 0.07)
                    }
                    
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.005, alignment: .leading)
                .padding()
                .padding(.top, UIScreen.main.bounds.height * 0.005)
                
                Image("b_3002")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.45, height: UIScreen.main.bounds.height * 0.2)
                    .opacity(0.6)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                    .padding(.top, UIScreen.main.bounds.height * 0.1)
                    .padding(.trailing, UIScreen.main.bounds.height * 0.05)
                
                Text(locationViewModel.cityName)
                    .foregroundColor(Color("bubble_dark"))
                    .font(.system(size: 25)).bold()
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                
                
                
            }
            .frame(maxWidth: UIScreen.main.bounds.width/2, maxHeight: UIScreen.main.bounds.height, alignment: .topLeading)
            .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .ignoresSafeArea()
            .onTapGesture{
                print("nothing")
            }
        } else {
            // Fallback on earlier versions
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
            window.rootViewController = UIHostingController(rootView: UserLikedView())
            window.makeKeyAndVisible()
        }
    }
    func goFeedback() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: FeedbackView().environmentObject(locationViewModel))
            window.makeKeyAndVisible()
        }
    }
    func goExit() {
        userAuth.logout()
        categoryGlobal.fetching = false
        categoryGlobal.posts = [[Post]](repeating: [], count: 5)
        showMenu = false
    }
}

