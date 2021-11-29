import SwiftUI
import Request

struct CommentsView: View {
    let comment: Comment
    @Binding var showingAlert: Bool
    @Binding var activeAlert: ActiveAlert
    @Binding var blockedUserId: Int
    @Binding var deletedCommentId: Int
    @State private var isShowingDetailView = false
    
    @State var isUp = false
    @State var isDown = false
    @State var totalVotes:Int = 0
    @State var upColor = Color.gray
    @State var downColor = Color.gray
    @State var isVoted = false
    @State var upVotesOnly = false
    @State var downVotesOnly = false
    @State private var submittedAlert = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(comment: Comment, showingAlert: Binding<Bool>, activeAlert: Binding<ActiveAlert>, blockedUserId: Binding<Int>, deletedCommentId: Binding<Int>) {
        self.comment = comment
        self._showingAlert = showingAlert
        self._activeAlert = activeAlert
        self._blockedUserId = blockedUserId
        self._deletedCommentId = deletedCommentId
        self._totalVotes = State(initialValue: comment.votes)
        
        if comment.is_voted == true
        {
            self._isVoted = State(initialValue: true)
            if comment.prev_vote == 1
            {
                self._isUp = State(initialValue: true)
                self._upColor = State(initialValue: Color.green)
            }
            else if comment.prev_vote == -1
            {
                self._isDown = State(initialValue: true)
                self._downColor = State(initialValue: Color.red)
            }
        }
    }
    var body: some View {
        HStack{
        VStack(alignment: .leading, spacing: -3){
            HStack{
                Spacer()
            Text(comment.content)
                .colorInvert()
                .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                .font(.system(size: 12))
                .lineLimit(3)
                .padding(.bottom, 2)
                Spacer()
            }.frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.05, alignment: .center)

            HStack{

                HStack(spacing:0){
                Text(comment.username)
                    .font(.system(size: 10))
                    .bold()
                    .lineLimit(1)
                    .padding(.leading, UIScreen.main.bounds.width * 0.03)
                    
                    Text(" - ")
                    
                    Text(comment.date_created)
                    .font(.system(size: 10))
                        .bold()
                }
                .colorInvert()
                .foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                
                Spacer()
                MetadataView(comment: comment,
                             isUp: self.$isUp,
                             isDown: self.$isDown,
                             totalVotes: self.$totalVotes,
                             upColor: self.$upColor,
                             downColor: self.$downColor,
                             isVoted: self.$isVoted,
                             upVotesOnly: self.$upVotesOnly,
                             downVotesOnly: self.$downVotesOnly)
                        .font(.caption)
                        .colorInvert()
                        .foregroundColor(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                        .padding(.trailing, UIScreen.main.bounds.width * 0.05)
                }
            NavigationLink(destination: SubmitContentReviewView(comment: comment), isActive: $isShowingDetailView) {
                            EmptyView()
                        }.buttonStyle(PlainButtonStyle())
            .disabled(true)

    }
        
    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.085)
        .background(Color.black)
        .colorInvert()
    .cornerRadius(25)
    .overlay(
        RoundedRectangle(cornerRadius: 25)
            .stroke(Color.white, lineWidth: 2)
    )
            if #available(iOS 14.0, *) {
                Menu {
                    if(UserDefaults.standard.integer(forKey: defaultsKeys.user_id) == comment.user_id || Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_type)) == 1)
                    {
                        Button("Delete Comment", action: {
                            self.showingAlert = true
                            self.activeAlert = .deleteComment
                            deletedCommentId = comment.id
                        })
                    }
                    Button("Report Comment", action: {

                         print(comment)
                        if(Int(UserDefaults.standard.integer(forKey: defaultsKeys.user_id)) == comment.user_id)
                         {
                            self.showingAlert = true
                             activeAlert = .sameUserReport
                         }
                         else
                         {
                             isShowingDetailView = true
                         }
                        
                    })
                    Button("Block User", action: {
                        showingAlert = true
                        print(comment)
                        if(Int(Constants.current_user_id) == comment.user_id)
                        {
                            activeAlert = .sameUserBlock
                        }
                        else
                        {
                            activeAlert = .blockUser
                            blockedUserId = comment.user_id
                        }
                    })
                } label: {
                    Label("", systemImage: "ellipsis").rotationEffect(.degrees(90)).foregroundColor(Color(red: 66 / 255, green: 126 / 255, blue: 132 / 255))
                }.offset(x: -UIScreen.main.bounds.width * 0.01)
            } else {
                // Fallback on earlier versions
            }
            
            
            }
        
}
}



