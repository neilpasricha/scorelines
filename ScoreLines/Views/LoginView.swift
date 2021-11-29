import SwiftUI
import JWTDecode

struct LoginView: View {

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    @State private var isRegister = false
    @State private var isForgotPassword = false
    @State private var categories = ["Deals", "Happy Hour", "Recreation", "What's Happening?", "Misc"]
    @State var users: [User] = []
    @State var token: [Jwt] = []
    

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @EnvironmentObject var userAuth: UserAuth
    @EnvironmentObject var categoryGlobal: Category
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View{
        
        if #available(iOS 14.0, *) {
            ScrollView{
            VStack
            {
                Image("dark_text")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.height * 0.4, height: UIScreen.main.bounds.height * 0.13)
                    .padding(.top, UIScreen.main.bounds.height * 0.175)
                    .padding(.bottom, UIScreen.main.bounds.height * 0.1)
                    .foregroundColor(Color.white)
                    .shadow(color: Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), radius: 1, x: 0, y: 8)
                
                HStack {
                    Image(systemName: "person")
                    
                    ZStack(alignment: .leading) {
                            if username.isEmpty {
                                Text("Username")
                                    .foregroundColor(.white)
                            }
                            TextField("", text: $username)
                        }
                    
                }
                .foregroundColor(Color.white)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.white))
                .frame(width: UIScreen.main.bounds.width * 0.8)
                HStack {
                    Image(systemName: "lock")
                    ZStack(alignment: .leading){
                        if password.isEmpty{
                            Text("Password")
                                .foregroundColor(Color.white)
                        }
                    SecureField("", text: self.$password)
                    }
                }
                .foregroundColor(Color.white)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color.white))
                .frame(width: UIScreen.main.bounds.width * 0.8)
                
                Button(action: {
                    let postObject: [String: Any]  =
                    [
                        "username": username,
                        "password": password,
                    ]
                    API().getUserPost(submitted: postObject)
                    { (result) in
                        switch result
                        {
                        case .success(let token):
                            self.token = token
                            userAuth.processJwt(jwt: self.token[0], password: password)
                            locationViewModel.retriveCurrentLocation()
                            categoryGlobal.fetchData(latitude: locationViewModel.userLatitude, longitude: locationViewModel.userLongitude)
                        case .failure(let error):
                            print(error)
                            self.showingAlert = true
                        }
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text("Login")
                            .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        Spacer()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(width: UIScreen.main.bounds.width * 0.8)
                })
                .alert(isPresented: $showingAlert)
                {
                    Alert(title: Text("Invalid Login"), message: Text("Please enter valid login"), dismissButton: .default(Text("Ok")))
                }
                HStack{
                    Spacer()
                    Button("Register") {
                        isRegister.toggle()
                            }
                    .fullScreenCover(isPresented: $isRegister, content: StartRegistrationView.init)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    Spacer()
                    Button("Forgot Password") {
                        isForgotPassword.toggle()
                            }
                    .fullScreenCover(isPresented: $isForgotPassword, content: PasswordReset.init)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    Spacer()
                }
                Spacer()
            }

            

        Spacer()
        }            .padding()
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .ignoresSafeArea()
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
        } else {
            // Fallback on earlier versions
        }
        
    }
    
}
