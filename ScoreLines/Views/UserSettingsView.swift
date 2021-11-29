import SwiftUI
import Request
import Introspect


struct UserSettingsView: View {
    
    
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var profileUsername: String
    
    @State private var username: String = ""
    @State private var default_post_title: String = "Location of post"
    @State private var post_title_pressed: Bool = false
    @State private var post_content: String = "Write some content for your post"
    @State private var default_post_content: String = "Write some content for your post"
    @State private var post_content_pressed: Bool = false
    @State private var category_id = Constants.DEFAULT_CATEGORY
    @State private var showingAlert = false
    @State private var errorMessage = ""
    @State private var allNotifications = true
    @State private var commentNotifications = true
    @State private var likesNotifications = true
    @State var changePassword : Bool = false
    @State var showBlocked : Bool = false
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmedPassword = ""
    @State private var unblockedUser = ""
    @State private var noBlockedAlert = false
    @State private var unblockedUserID = ""
    
    @State private var deals_clicked = false
    @State private var happy_clicked = false
    @State private var rec_clicked = false
    @State private var what_clicked = false
    @State private var misc_clicked = false
    
    @State private var categories = ["Deals", "Happy Hour", "Recreation", "What's Happening?", "Misc"]
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @EnvironmentObject var categoryGlobal: Category
    @EnvironmentObject var categorySettings: Category
    
    @State var blockedUsers: [BlockedUser] = []
    
    enum SettingsAlert {
        case empty, mismatch, invalid, password, username, unblock, noBlocked
    }
    
    @State private var activeAlert: SettingsAlert = .empty
    
    var body: some View
    {
        ScrollView{
            
        if #available(iOS 14.0, *) {
            VStack(alignment: .leading){
                Spacer()
                
                VStack{
                Text("Account")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    Divider().frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.01).background(Color("bubble_dark")).padding(-2.5)
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.25)
                .padding(.top)
                Spacer()
                VStack(alignment: .leading) {
                    VStack(alignment:.leading){
                Text("User Settings")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.leading, 2.5)
                        
                        Divider().frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.01).background(Color("bubble_dark")).padding(-UIScreen.main.bounds.width * 0.005).padding(.leading, UIScreen.main.bounds.width * 0.04)
                    }
                Text("Change Username")
                    .foregroundColor(.white)
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    
                    TextField(profileUsername, text: $username, onCommit: {
                        let user_setting_object: [String: Any]  =
                            [
                                "setting": "username",
                                "value": username
                            ]
                        API().updateUserSetting(submitted: user_setting_object)
                        profileUsername = username
                        UserDefaults.standard.set(profileUsername, forKey: defaultsKeys.username)
                        self.showingAlert = true
                        activeAlert = .username
                    })
                    .padding(.leading, UIScreen.main.bounds.width * 0.01)
                        .alert(isPresented:$showingAlert){
                            switch activeAlert{
                                case .empty:
                                    return Alert(title: Text("Please enter password"),
                                                 message: Text(""),
                                                 dismissButton: .default(Text("OK"), action: {}))
                                case .mismatch:
                                    return Alert(title: Text("New passwords do not match"),
                                                 message: Text(""),
                                                 dismissButton: .default(Text("OK"), action: {}))
                                case .invalid:
                                    return Alert(title: Text("Invalid password"),
                                                 message: Text(""),
                                                 dismissButton: .default(Text("OK"), action: {}))
                                case .password:
                                    return Alert(title: Text("Password has been updated"),
                                                 message: Text(""),
                                                 dismissButton: .default(Text("OK"), action: {}))
                                case .username:
                                    return Alert(title: Text("Username has been updated"),
                                                 message: Text(""),
                                                 dismissButton: .default(Text("OK"), action: {}))
                                case .unblock:
                                    return Alert(title: Text("Unblock " + unblockedUser + "?"),
                                                 message: Text(""),
                                                 primaryButton: .default(Text("OK")){
                                                    let unblockUserObject: [String: Any]  =
                                                        [
                                                            "blocked_user_id": self.unblockedUserID
                                                        ]
                                                    API().unblockUser(submitted: unblockUserObject)
                                                    
                                                    API().getBlockedUsers()
                                                    { (result) in
                                                        switch result
                                                        {
                                                            case .success(let blockedUsers):
                                                                self.blockedUsers = blockedUsers
                                                            case .failure(let error):
                                                                print(error)
                                                        }
                                                    }
                                                 },
                                                 secondaryButton: .cancel()
                                                 )
                            case .noBlocked:
                                    return Alert(title: Text("You have no blocked users"),
                                             message: Text(""),
                                             dismissButton: .default(Text("Dismiss"), action: {}))
                            }
                        }
                        .keyboardType(.webSearch)
                        .font(.system(size: 18))
                        .lineLimit(0)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .background(Color(.white))
                        .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                        )
                    .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.03)
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                HStack{//HStack containing the button to show/hide password form
                Text("Change Password")
                    .foregroundColor(.white)
                    Button(action:{
                        self.changePassword.toggle()
                    }){
                    Image(systemName: self.changePassword == false ? "eye.slash": "eye")
                        .foregroundColor(Color("bubble_dark"))
                    }
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    if changePassword{
                    Section{
                        SecureField("Old password", text: $oldPassword)
                            .padding(.leading, UIScreen.main.bounds.width * 0.01)
                            .font(.system(size: 18))
                            .textContentType(.newPassword)
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            .background(Color(.white))
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                            )
                            
                            .padding(.leading, UIScreen.main.bounds.width * 0.05)
                            .frame(width: UIScreen.main.bounds.width * 0.42)
                        SecureField("New password", text: $newPassword)
                            .padding(.leading, UIScreen.main.bounds.width * 0.01)
                            .font(.system(size: 18))
                            .textContentType(.newPassword)
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            
                            .background(Color(.white))
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                            )
                            
                            .padding(.leading, UIScreen.main.bounds.width * 0.05)
                            .frame(width: UIScreen.main.bounds.width * 0.42)
                        SecureField("New password", text: $confirmedPassword, onCommit: {
                            print(oldPassword)
                            print(newPassword)
                            print(confirmedPassword)
                            if(oldPassword.isEmpty || newPassword.isEmpty || confirmedPassword.isEmpty)
                            {
                                self.showingAlert = true
                                activeAlert = .empty
                            }
                            else if(newPassword != confirmedPassword)
                            {
                                self.showingAlert = true
                                activeAlert = .mismatch
                            }
                            else if(oldPassword != UserDefaults.standard.string(forKey: defaultsKeys.password)!)
                            {
                                self.showingAlert = true
                                activeAlert = .invalid
                            }
                            else
                            {
                                let user_setting_object: [String: Any]  =
                                    [
                                        "setting": "password",
                                        "value": newPassword
                                    ]
                                API().updateUserSetting(submitted: user_setting_object)
                                UserDefaults.standard.set(newPassword, forKey: defaultsKeys.password)
                                self.showingAlert = true
                                activeAlert = .password
                                self.oldPassword = ""
                                self.newPassword = ""
                                self.confirmedPassword = ""
                                self.changePassword.toggle()
                            }
                            
                        })
                        .padding(.leading, UIScreen.main.bounds.width * 0.01)
                            .keyboardType(.webSearch)
                            .font(.system(size: 18))
                            .textContentType(.newPassword)
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            .background(Color(.white))
                            .cornerRadius(18)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                            )
                            .padding(.leading, UIScreen.main.bounds.width * 0.05)
                            .frame(width:UIScreen.main.bounds.width * 0.42)
                    }
                    }

            }//User Settings VStack
                
            Spacer()
                VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Default Category")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.leading, 2.5)
                        
                    Divider().frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.01).background(Color("bubble_dark")).padding(-UIScreen.main.bounds.width * 0.005).padding(.leading, UIScreen.main.bounds.width * 0.04)
                        }
                HStack {
                    Spacer()
                    ForEach(0 ..< categorySettings.categories.count) { i in
                            Button(action: {
                                categorySettings.category_clicked = categorySettings.category_clicked_combinations[i]
                                print(categorySettings.category_clicked)
                                category_id = i + 1
                                let default_category_object: [String: Any]  =
                                    [
                                        "default_category_id": category_id,
                                    ]
                                API().setDefaultCategory(submitted: default_category_object)
                            }){
                                VStack(spacing: 0){
                                Image(categorySettings.category_clicked[i] == 1 ? categorySettings.selected_cat_names1[i] : categorySettings.cat_names1[i]).resizable().frame(width:40, height:40).padding()
//                                    Text(categoryGlobal.categories[i])
//                                    .font(.system(size: 12))
//                                    .foregroundColor(Color.white)
                                }
                            }.buttonStyle(PlainButtonStyle())
                    }
                }.background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                .frame(width:UIScreen.main.bounds.width*0.9, alignment: .center)
                }//Default Category vStack
            Spacer()
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                Text("Privacy")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.leading, 2.5)
                    
                Divider().frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.01).background(Color("bubble_dark")).padding(-UIScreen.main.bounds.width * 0.005).padding(.leading, UIScreen.main.bounds.width * 0.04)
                }
                HStack{//HStack containing the button to show/hide blocked users form
                Text("Blocked Users")
                    .foregroundColor(.white)
                    Button(action:{
                        self.showBlocked.toggle()
                        API().getBlockedUsers()
                        { (result) in
                            switch result
                            {
                                case .success(let blockedUsers):
                                    self.blockedUsers = blockedUsers
                                case .failure(let error):
                                    print(error)
                            }
                        }
                    }){
                    Image(systemName: self.showBlocked == false ? "eye.slash": "eye")
                        .foregroundColor(Color("bubble_dark"))
                        .padding(.leading, UIScreen.main.bounds.width * 0.06)
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.0125)
                .padding(.leading, UIScreen.main.bounds.width * 0.05)
                
                if showBlocked{
                    if !blockedUsers.isEmpty{
                        VStack{
                            ForEach(blockedUsers){blockedUser in
                                HStack{
                                    Text(blockedUser.blocked_username)
                                    Spacer()
                                    Button(action:{
                                        self.unblockedUserID = blockedUser.blocked_user_id
                                        self.unblockedUser = blockedUser.blocked_username
                                        self.showingAlert = true
                                        activeAlert = .unblock
                                    }){
                                        Image(systemName: "trash")
                                    }.buttonStyle(PlainButtonStyle())
                                }
                                
                                .padding(.top, UIScreen.main.bounds.width * 0.0225)
                                .padding(.bottom, UIScreen.main.bounds.width * 0.0225)
                                .frame(width:UIScreen.main.bounds.width * 0.5, height:UIScreen.main.bounds.height * 0.025)
                                
                                .background(Color.white)

                              }
                        }
                        .padding(.leading, UIScreen.main.bounds.width * 0.0225)
                        .padding(.trailing, UIScreen.main.bounds.width * 0.0225)
                        .padding(.top, UIScreen.main.bounds.width * 0.0225)
                        .padding(.bottom, UIScreen.main.bounds.width * 0.0225)
                        .background(Color.white)
                        .cornerRadius(18)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color("bubble_dark"), lineWidth: 2))
                        .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    }
                        
                    
                    else{
//                        self.showingAlert = true
//                        activeAlert = .noBlocked
                    }

                }
                
            }//Privacy VStack
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                Text("Notifications")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .padding(.leading, 2.5)
                    
                Divider().frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.01).background(Color("bubble_dark")).padding(-UIScreen.main.bounds.width * 0.005).padding(.leading, UIScreen.main.bounds.width * 0.04)
                }
                Toggle("All Notifications", isOn: $allNotifications)
                    .foregroundColor(.white)
                    .toggleStyle(SwitchToggleStyle(tint: Color("bubble_dark")))
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    .frame(width: UIScreen.main.bounds.width * 0.9)

                if allNotifications {
                    //Disable notifications logic here
                }
                
                Toggle("Comments on your posts", isOn: $commentNotifications)
                    .foregroundColor(.white)
                    .toggleStyle(SwitchToggleStyle(tint: Color("bubble_dark")))
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    .frame(width: UIScreen.main.bounds.width * 0.9)

                if commentNotifications {
                    //Disable notifications logic here
                }
                
                Toggle("Likes on your posts", isOn: $likesNotifications)
                    .foregroundColor(.white)
                    .toggleStyle(SwitchToggleStyle(tint: Color("bubble_dark")))
                    .padding(.leading, UIScreen.main.bounds.width * 0.05)
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                if likesNotifications {
                    //Disable notifications logic here
                }
            }.hidden()
            Spacer()
        }//Encompassing VStack
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            .ignoresSafeArea()
        .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            }

        
            else {
            // Fallback on earlier versions
        }
        }//end ScrollView
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .edgesIgnoringSafeArea(.bottom)
    }
    
}
