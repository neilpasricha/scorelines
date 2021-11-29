//
//  NotificationPostView.swift
//  Bubble
//
//  Created by steven tran on 7/2/21.
//  Copyright © 2021 Bubble. All rights reserved.
//

import SwiftUI

struct NotificationPostView: View {
    let post: Post
    
    @State var isUp = false
    @State var isDown = false
    @State var totalVotes:Int = 0
    @State var upColor = Color.gray
    @State var downColor = Color.gray
    @State var isVoted = false
    @State var upVotesOnly = false
    @State var downVotesOnly = false
    @State private var postDetailSend = true
    
    init(post: Post) {
        self.post = post
        self._totalVotes = State(initialValue: post.votes)
        
        if post.is_voted == true
        {
            self._isVoted = State(initialValue: true)
            if post.prev_vote == 1
            {
                self._isUp = State(initialValue: true)
                self._upColor = State(initialValue: Color.green)
            }
            else if post.prev_vote == -1
            {
                self._isDown = State(initialValue: true)
                self._downColor = State(initialValue: Color.red)
            }
        }
    }
    
    var body: some View
    {
        ZStack{
        NavigationLink(destination: PostDetailView( post: post,
                                                    isUp: self.$isUp,
                                                    isDown: self.$isDown,
                                                    totalVotes: self.$totalVotes,
                                                    upColor: self.$upColor,
                                                    downColor: self.$downColor,
                                                    isVoted: self.$isVoted,
                                                    upVotesOnly: self.$upVotesOnly,
                                                    downVotesOnly: self.$downVotesOnly)
            )
        {EmptyView()}.buttonStyle(PlainButtonStyle()).frame(width:0).opacity(0).hidden()
            HStack{
                Text((post.notificaiton_username ?? "") + " replied " + (post.notification_content ?? "") + " to your post")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 12))
            }
    }.onAppear {
        UITableViewCell.appearance().selectionStyle = .none
     }
    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height/9, alignment: .center)
    .background(Color.white)
    .cornerRadius(20)
    .overlay(
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color.white, lineWidth: 2)
    )
   .buttonStyle(PlainButtonStyle())
        
    }
}
