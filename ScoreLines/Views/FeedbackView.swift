//
//  ReportView.swift
//  Bubble
//
//  Created by Neil Pasricha on 11/12/20.
//  Copyright © 2020 Bubble. All rights reserved.
//

class FeedbackLimiter: ObservableObject {
    var limit: Int = 300

    @Published var feedback_comment: String = "Enter feedback here..." {
        didSet {
            if feedback_comment.count > limit {
                feedback_comment = String(feedback_comment.prefix(limit))
            }
        }
    }
}

import SwiftUI
import SlideOverCard

struct FeedbackView: View{
    @State private var commentBoxPressed: Bool = false
    @State private var feedback_content: String = "Enter feedback here..."
    @State private var submittedReportAlert = false
    @State private var position = CardPosition.bottom
    @State private var submittedAlert = false
    @ObservedObject private var feedbackLimiter = FeedbackLimiter()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View{
        ScrollView{
            VStack(){
                HStack{

                        Image("menu_report")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        Text("feedback")
                            .font(.system(size:48))
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.black, radius: 3, y:1)
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        Image("menu_report")
                            .resizable()
                            .frame(width: 40.0, height: 40.0)
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                           
                    
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.05)
                .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            Spacer()
            Spacer()
                Spacer()
                HStack{
                    Spacer()
            if #available(iOS 14.0, *)
            {
                //We are currently allowing there to be trailing spaces after comments, need to auto remove those from the comment
                //object before we actually let it be submitted
                TextEditor(text: self.$feedbackLimiter.feedback_comment)
                    
                    .onTapGesture {
                        if !self.commentBoxPressed{
                            feedbackLimiter.feedback_comment = ""
                            self.commentBoxPressed = true
                        }
                    }
                    .multilineTextAlignment(.leading)
                    .foregroundColor(commentBoxPressed ? Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255) : Color.gray)
                    
                   // .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    .background(Color(red: 171 / 255, green: 233 / 255, blue: 255 / 255))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                    )
                    
                    .frame(minWidth: UIScreen.main.bounds.width * 0.9, maxWidth: UIScreen.main.bounds.width * 0.9, minHeight: UIScreen.main.bounds.height * 0.1, maxHeight: UIScreen.main.bounds.height * 0.2)
            }
                    Spacer()
                }
            Spacer()
            Spacer()
            Button(action:
            {
                let feedback_object: [String: Any]  =
                    [
                        "content": feedbackLimiter.feedback_comment,
                        "latitude": locationViewModel.userLatitude,
                        "longitude": locationViewModel.userLongitude,
                    ]
                API().submitFeedback(submitted: feedback_object)
                self.submittedAlert = true
                let resign = #selector(UIResponder.resignFirstResponder)
                UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
                //self.presentationMode.wrappedValue.dismiss()
                
            })
            {
                Text("Submit")
                    .fontWeight(.bold)
                    .padding(8)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .background(Color(red: 171 / 255, green: 233 / 255, blue: 255 / 255))
                    .cornerRadius(16)
                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                    )
                
                
            }
            .background(Color("bubble_blue"))
            .buttonStyle(PlainButtonStyle())
            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .alert(isPresented: $submittedAlert)
            {
                Alert(title: Text(""), message: Text("Thank you for your feedback!"), dismissButton: .default(Text("Close")){
                    self.presentationMode.wrappedValue.dismiss()
                })
            }
            }
            .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        }
        .padding(.top, UIScreen.main.bounds.height * 0.05)
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .edgesIgnoringSafeArea(.bottom)
    }
}
