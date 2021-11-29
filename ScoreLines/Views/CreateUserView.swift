//
//  CreateUserView.swift
//  Localist
//
//  Created by Steven Tran on 9/26/20.
//  Copyright © 2020 Localist. All rights reserved.
//

//TODO
/*
    Successful button click takes you to main screen
        - Validate successful response
        - Pop current screen
 */
import SwiftUI

struct CreateUserView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var termsAccepted = false
    @State private var showingAlert = false
    
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var categoryGlobal: Category

    var body: some View {
            Form {
                TextField("Username", text: self.$username).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: self.$password)
                TextField("Email", text: self.$email).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                Toggle(isOn: $termsAccepted,
                       label: {
                           Text("Accept terms and conditions")
                })
                if #available(iOS 14.0, *) {
                    Link("View Our Terms of Service",
                         destination: URL(string: "https://www.termsfeed.com/live/ffdd0de8-f5d2-41db-9b04-b89bdd99f685")!)
                } else {
                    // Fallback on earlier versions
                }
                
                if self.isUserInformationValid() {
                    Button(action: {
                        let postObject: [String: Any]  =
                            [
                                "username": self.$username.wrappedValue,
                                "user_type": 2,
                                "password": self.$password.wrappedValue,
                                "email": self.$email.wrappedValue
                            ]
                        API().createUser(submitted: postObject)
                        self.showingAlert = true
                    }, label: {
                        Text("Create")
                    })
                    .alert(isPresented: $showingAlert)
                    {
                        Alert(title: Text("Account Created"), message: Text("Check you email to validate your account"), dismissButton: .default(Text("Ok"))
                                {
                                    if let window = UIApplication.shared.windows.first {
                                        window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(userAuth).environmentObject(categoryGlobal))
                                        window.makeKeyAndVisible()
                                    }
                                }
                        )
                    }
                }
            }.navigationBarTitle(Text("Create User"))
    }
    
    private func isUserInformationValid() -> Bool {
        if username.isEmpty || password.isEmpty || email.isEmpty || !termsAccepted{
            return false
        }
        else
        {
            return true
        }
    }
}

