//
//  NotificationView.swift
//  Bubble
//
//  Created by steven tran on 7/2/21.
//  Copyright © 2021 Bubble. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    @State var posts: [Post] = []
    var body: some View {
            List{
                ForEach(posts){ post in
                    NotificationPostView(post: post)
                        .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                }
            }
            .navigationBarTitle(Text("Notification"), displayMode: .inline)
            .onAppear
            {
                API().getNotifcaitonPosts
                { (result) in
                    switch result
                    {
                        case .success(let posts):
                            self.posts = posts
                        case .failure(let error):
                            print(error)
                    }
                }
            }
        .padding(.top)
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .edgesIgnoringSafeArea(.bottom)
    }
}
