import SwiftUI
import Request
import SwiftUIRefresh
import Combine

class TextLimiter: ObservableObject {
    var limit: Int = 125

    @Published var comment_content: String = "Enter comment here..." {
        didSet {
            if comment_content.count > limit {
                comment_content = String(comment_content.prefix(limit))
            }
        }
    }
}

struct KeyboardResponsiveModifier: ViewModifier {
  @State private var offset: CGFloat = 0

  func body(content: Content) -> some View {
    content
      .padding(.bottom, offset)
      .onAppear {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
          let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
          let height = value.height + UIScreen.main.bounds.width * 0.05
          let bottomInset = UIApplication.shared.windows.first?.safeAreaInsets.bottom
          self.offset = height - (bottomInset ?? 0)
        }

        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { notif in
          self.offset = 0
        }
    }
  }
}
extension View {
  func keyboardResponsive() -> ModifiedContent<Self, KeyboardResponsiveModifier> {
    return modifier(KeyboardResponsiveModifier())
  }
}

struct PostDetailView: View {
    let post: Post
    
    @State private var activeAlert: ActiveAlert = .blockUser
    
    @Binding var isUp: Bool
    @Binding var isDown: Bool
    @Binding var totalVotes: Int
    @Binding var upColor: Color
    @Binding var downColor: Color
    @Binding var isVoted: Bool
    @Binding var upVotesOnly: Bool
    @Binding var downVotesOnly: Bool
    
    @State private var isShowing = false
    @State var comments: [Comment] = []
    @State private var commentBoxPressed: Bool = false
    //@State private var default_comment: String = "Enter comment here..."
    @State private var placeholder_default_comment: String = "Enter comment here..."
    @State private var showingAlert = false
    @State private var blockedUserId = 0
    @State private var deletedCommentId = 0
    @State private var isShowingDetailView = false
    
    @ObservedObject private var textLimiter = TextLimiter()
    @EnvironmentObject var categoryGlobal: Category
    @EnvironmentObject var locationViewModel: LocationViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        if #available(iOS 14.0, *) {
            VStack(alignment: .leading)
            {
                VStack(spacing: 0){
                    HStack(alignment: .center){
                    Text(post.title)
                        .bold()
                        .underline()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.system(size:20))
                }
                    HStack(){
                        Spacer()
                Text(post.content)
                    .font(.system(size:15))
                    .padding(.leading, 18)
                    .multilineTextAlignment(.center)
                    Spacer()
                    MetadataView(post: post,
                                 isUp: self.$isUp,
                                 isDown: self.$isDown,
                                 totalVotes: self.$totalVotes,
                                 upColor: self.$upColor,
                                 downColor: self.$downColor,
                                 isVoted: self.$isVoted,
                                 upVotesOnly: self.$upVotesOnly,
                                 downVotesOnly: self.$downVotesOnly)
                        .offset(y: -UIScreen.main.bounds.height * 0.01)
                }
            }//End title, content, voting vstack
                .padding()
                .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width * 0.95, minHeight: UIScreen.main.bounds.height * 0.1, maxHeight: UIScreen.main.bounds.height * 0.15)
                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                .background(Color.white)
                .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                )
                .padding(.leading, UIScreen.main.bounds.width * 0.025)
                .padding(.top, UIScreen.main.bounds.height * 0.01)
                
                HStack{
                    HStack(spacing:0){
                        Text(post.username)
                            .font(.system(size:12))
                            .bold()
                        Text(" - ")
                        Text(post.date_created)
                            .font(.system(size:12))
                            .bold()
                    }
                    .foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                    .padding(.leading, UIScreen.main.bounds.width * 0.07)
                    Spacer()
                    
                    NavigationLink(destination: SubmitContentReviewView(post: post), isActive: $isShowingDetailView) {
                                    EmptyView()
                                }.buttonStyle(PlainButtonStyle())
                                .disabled(true)
                    HStack{
                        Image(systemName: "text.bubble")
                            .resizable()
                            .frame(width: 12, height:12)
                            .foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                                Text(String(comments.count))
                            .font(.system(size: 12))
                            .foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                        if #available(iOS 14.0, *) {
                            Menu {
                                if(Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_id)) == post.user_id || Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_type)) == 1)
                                {
                                    Button("Delete Post", action: {
                                        self.showingAlert = true
                                        self.activeAlert = .deletePost
                                    })
                                }
                                Button("Report Post", action: {
                                    
                                    if(Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_id)) == post.user_id)
                                    {
                                        self.showingAlert = true
                                        self.activeAlert = .sameUserReport
                                    }
                                    else
                                    {
                                        isShowingDetailView = true
                                    
                                    }
                                        
                                })
                                Button("Block User", action: {
                                    self.showingAlert = true
                                    if(Int(Constants.current_user_id) == post.user_id)
                                    {
                                        self.activeAlert = .sameUserBlock
                                    }
                                    else
                                    {
                                        self.activeAlert = .blockUser
                                        blockedUserId = post.user_id
                                    }
                                })
                            } label: {
                                Label("", systemImage: "ellipsis").foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                             
                            }.padding(.bottom, UIScreen.main.bounds.width * 0.01)
                            .padding(.trailing, UIScreen.main.bounds.width * 0.07)
                        } else {
                            // Fallback on earlier versions
                        }
                            }
                        .padding(.leading, UIScreen.main.bounds.width * 0.07)
                }.padding(.top, UIScreen.main.bounds.width * 0.01)
                
                Divider()
                    .background(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                    .frame(width: UIScreen.main.bounds.width * 0.95)
                    .padding(.leading, UIScreen.main.bounds.width * 0.01)

                VStack{
                    if #available(iOS 14.0, *) {
                        List{
                            ForEach(comments){comment in
                                CommentsView(comment: comment, showingAlert: $showingAlert, activeAlert: $activeAlert, blockedUserId: $blockedUserId, deletedCommentId: $deletedCommentId)
                                .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                            }
                        }
                        
                        .onAppear{
                            API().getComment(post_id: post.post_id)
                            { (result) in
                                switch result
                                {
                                    case .success(let comments):
                                        self.comments = comments
                                    case .failure(let error):
                                        print(error)
                                }
                            }
                        }
                        .pullToRefresh(isShowing: $isShowing) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                API().getComment(post_id: post.post_id)
                                { (result) in
                                    switch result
                                    {
                                        case .success(let comments):
                                            self.comments = comments
                                        case .failure(let error):
                                            print(error)
                                    }
                                }
                                self.isShowing = false
                            }
                        }.onChange(of: self.isShowing){value in} //Seriously just don't even bother looking into this
                    } else {
                        // Fallback on earlier versions
                    }
                }

                HStack{
                    if #available(iOS 14.0, *)
                    {
                        TextEditor(text: $textLimiter.comment_content)
                            
                            .onTapGesture {
                                if !self.commentBoxPressed{
                                    textLimiter.comment_content = ""
                                    self.commentBoxPressed = true
                                }
                            }
                            
                            .multilineTextAlignment(.leading)
                            
                            .frame(minWidth: UIScreen.main.bounds.width * 0.75, maxWidth: UIScreen.main.bounds.width * 0.9, minHeight: UIScreen.main.bounds.height * 0.01, maxHeight: UIScreen.main.bounds.height * 0.08)
                            .padding(5)
                            .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                            
                            .colorMultiply(Color(red: 171 / 255, green: 233 / 255, blue: 255 / 255))
                            .background(Color(red: 171 / 255, green: 233 / 255, blue: 255 / 255))
                            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255), lineWidth: 2)
                            )
                            .padding(.top, 2)
                        
                    }
                    Spacer()
                    Button(action:
                            {
                                let resign = #selector(UIResponder.resignFirstResponder)
                                UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
                                self.showingAlert = true
                                self.activeAlert = .confirmComment
                            })
                    {
                        Image(systemName:"paperplane.fill")
                            .foregroundColor(Color("bubble_dark"))
                        
                    }
                    .alert(isPresented:$showingAlert){
                        switch activeAlert{
                        
                        case .confirmComment:
                            return Alert(title: Text("Submit comment?"),
                                         message: Text(""),
                                         primaryButton: .default(Text("Submit")){
                                            var notify = true
                                            if(Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_id)) == post.user_id)
                                            {
                                                notify = false
                                            }
                                            
                                            let commentObject: [String: Any]  =
                                               [
                                                   "post_id": post.post_id,
                                                    "content": textLimiter.comment_content,
                                                    "notify": notify
                                               ]
                                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                               API().submitComment(submitted: commentObject)
                                            textLimiter.comment_content = self.placeholder_default_comment
                                           }
                                           
                                           DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                               API().getComment(post_id: post.post_id)
                                               { (result) in
                                                   switch result
                                                   {
                                                       case .success(let comments):
                                                           self.comments = comments
                                                       case .failure(let error):
                                                           print(error)
                                                   }
                                               }
                                           }
                                           self.commentBoxPressed.toggle()
                                         },
                                         secondaryButton: .cancel())
                        case .blockUser:
                            return Alert(title: Text("Block User?"),
                                         message: Text(""),
                                         primaryButton: .default(Text("Confirm")){
                                            
                                            let block_user_object: [String: Any]  =
                                            [
                                               "blocked_user_id": blockedUserId,
                                               "blocked_reason": "",
                                               "blocked_type": ""
                                            ]
                                            API().blockUser(submitted: block_user_object)
                                            locationViewModel.retriveCurrentLocation()
                                            categoryGlobal.refreshCategory(category: categoryGlobal.currCategory, longitude: locationViewModel.userLongitude , latitude: locationViewModel.userLatitude)
                                            self.presentationMode.wrappedValue.dismiss()
                                       },
                                         secondaryButton: .cancel())
                        case .deletePost:
                            return Alert(title: Text("Delete Post?"),
                                         message: Text(""),
                                         primaryButton: .default(Text("Confirm")){
                                            let content_delete_object: [String: Any]  =
                                            [
                                               "post_id": post.post_id,
                                               "content_type": "post"
                                            ]
                                            API().submitContentDelete(submitted: content_delete_object)
                                            locationViewModel.retriveCurrentLocation()
                                            categoryGlobal.refreshCategory(category: categoryGlobal.currCategory, longitude: locationViewModel.userLongitude , latitude: locationViewModel.userLatitude)
                                            self.presentationMode.wrappedValue.dismiss()
                                       },
                                         secondaryButton: .cancel())
                        case .deleteComment:
                            return Alert(title: Text("Delete Comment?"),
                                         message: Text(""),
                                         primaryButton: .default(Text("Confirm")){
                                           let content_delete_object: [String: Any]  =
                                               [
                                                   "comment_id": deletedCommentId,
                                                   "content_type": "comment"
                                               ]
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                                API().submitContentDelete(submitted: content_delete_object)
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                API().getComment(post_id: post.post_id)
                                                { (result) in
                                                    switch result
                                                    {
                                                        case .success(let comments):
                                                            self.comments = comments
                                                        case .failure(let error):
                                                            print(error)
                                                    }
                                                }
                                            }
                                       },
                                         secondaryButton: .cancel())
                        case .sameUserBlock:
                            return Alert(title: Text("You cannot block yourself"),
                                         message: Text(""),
                                         dismissButton: .default(Text("OK"), action: {}))
                        case .sameUserReport:
                            return Alert(title: Text("You cannot report yourself"),
                                         message: Text(""),
                                         dismissButton: .default(Text("OK"), action: {}))
                                   }
                               }
                    .disabled(textLimiter.comment_content == self.placeholder_default_comment || textLimiter.comment_content.isEmpty)
                    Spacer()
                }
                .padding(.leading, UIScreen.main.bounds.width * 0.025)
                .padding(.bottom, UIScreen.main.bounds.width * 0.05)
                Spacer()
            }
            
            .keyboardResponsive()
            .listRowBackground(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
               
                if textLimiter.comment_content.isEmpty{
                    textLimiter.comment_content = self.placeholder_default_comment
                    self.commentBoxPressed.toggle()
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        } else {
            // Fallback on earlier versions
        }
            
    }
}

struct FooterView: View {
    @State private var comment_content: String = ""
    @State private var placeholderString: String = "Add a comment"
    
    let post: Post
    
    var body: some View {
        MultilineTextField("Enter comment here...", text: self.$comment_content)
            .frame(maxWidth: .infinity, minHeight: 100)
        Button(action:
        {
            let commentObject: [String: Any]  =
                [
                    "post_id": post.post_id,
                    "content": self.comment_content,
                ]
            API().submitComment(submitted: commentObject)
            self.comment_content = ""
        })
        {
            Text("Submit")
        }
    }
}

public struct TextAlert {
  public var title: String // Title of the dialog
  public var message: String // Dialog message
  public var placeholder: String = "" // Placeholder text for the TextField
  public var accept: String = "OK" // The left-most button label
  public var cancel: String? = "Cancel" // The optional cancel (right-most) button label
  public var secondaryActionTitle: String? = nil // The optional center button label
  public var keyboardType: UIKeyboardType = .default // Keyboard tzpe of the TextField
  public var action: (String?) -> Void // Triggers when either of the two buttons closes the dialog
  public var secondaryAction: (() -> Void)? = nil // Triggers when the optional center button is tapped
}

extension UIAlertController {
  convenience init(alert: TextAlert) {
    self.init(title: alert.title, message: alert.message, preferredStyle: .alert)
    addTextField {
       $0.placeholder = alert.placeholder
       $0.keyboardType = alert.keyboardType
    }
    if let cancel = alert.cancel {
      addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
        alert.action(nil)
      })
    }
    if let secondaryActionTitle = alert.secondaryActionTitle {
       addAction(UIAlertAction(title: secondaryActionTitle, style: .default, handler: { _ in
         alert.secondaryAction?()
       }))
    }
    let textField = self.textFields?.first
    addAction(UIAlertAction(title: alert.accept, style: .default) { _ in
      alert.action(textField?.text)
    })
  }
}

struct AlertWrapper<Content: View>: UIViewControllerRepresentable {
  @Binding var isPresented: Bool
  let alert: TextAlert
  let content: Content

  func makeUIViewController(context: UIViewControllerRepresentableContext<AlertWrapper>) -> UIHostingController<Content> {
    UIHostingController(rootView: content)
  }

  final class Coordinator {
    var alertController: UIAlertController?
    init(_ controller: UIAlertController? = nil) {
       self.alertController = controller
    }
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator()
  }

  func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: UIViewControllerRepresentableContext<AlertWrapper>) {
    uiViewController.rootView = content
    if isPresented && uiViewController.presentedViewController == nil {
      var alert = self.alert
      alert.action = {
        self.isPresented = false
        self.alert.action($0)
      }
      context.coordinator.alertController = UIAlertController(alert: alert)
      uiViewController.present(context.coordinator.alertController!, animated: true)
    }
    if !isPresented && uiViewController.presentedViewController == context.coordinator.alertController {
      uiViewController.dismiss(animated: true)
    }
  }
}

extension View {
  public func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
    AlertWrapper(isPresented: isPresented, alert: alert, content: self)
  }
}

var menuItems: some View {
    Group {
        Button("Action 1", action: {})
        Button("Action 2", action: {})
        Button("Action 3", action: {})
    }
}
