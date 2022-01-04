//  ScoreLines
//
//  Created by Neil Pasricha on 1/4/22.
//
import SwiftUI

struct MenuView : View {
    @Binding var showMenu: Bool
    
    
    var body : some
        
    View{
            if #available(iOS 15.0, *) {
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
                        NavigationLink(destination: FeedView())
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
                        NavigationLink(destination: FeedView())
                        {
                            Text("favorites").foregroundColor(.white).font(.system(size: 23)).bold()
                                .padding(.leading, UIScreen.main.bounds.height * 0.03)
                                .padding(.top, UIScreen.main.bounds.height * 0.005)
                        }
                        Divider().frame(width: UIScreen.main.bounds.width * 0.25, height: UIScreen.main.bounds.height * 0.003).background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            .padding(.leading, UIScreen.main.bounds.width * 0.06)
                        
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
                        NavigationLink(destination: FeedView())
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
                    
                    
                    
                    Button(action: goLiked)
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
                    
                    Text("Austin")
                        .foregroundColor(Color("bubble_dark"))
                        .font(.system(size: 25)).bold()
                        .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.1)
                    
                    
                    
                }
                .frame(maxWidth: UIScreen.main.bounds.width/2, maxHeight: UIScreen.main.bounds.height, alignment: .topLeading)
                .background(.teal)
                .onTapGesture{
                    print("nothing")
                }
                
                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.bottom)
            } else {
                // Fallback on earlier versions
            }
        
        
    }
    func goProfile() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: FeedView())
            window.makeKeyAndVisible()
        }
    }
    func goLiked() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: FeedView())
            window.makeKeyAndVisible()
        }
    }
    func goFeedback() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: FeedView())
            window.makeKeyAndVisible()
        }
    }

}

