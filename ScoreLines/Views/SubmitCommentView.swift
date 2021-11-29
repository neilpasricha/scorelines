import SwiftUI
import Request

struct SubmitCommentView: View {
    @State private var post_title: String = ""
    @State private var post_content: String = ""
    //@State private var comment_content: String = "Enter your comment here"
    @State private var commentBoxPressed: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var textLimiter = TextLimiter()
    let post: Post
    
    
    var body: some View
    {


            Form {
                    Text(post.title).font(.system(size:25))
                    .foregroundColor(Color.black)
                    .italic()
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowBackground(Color(red: 0 / 255, green: 255 / 255, blue: 255 / 255))
                
                Text(post.content)
                    .foregroundColor(Color.black)
                    .italic()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowBackground(Color(red: 0 / 255, green: 255 / 255, blue: 255 / 255))
                if #available(iOS 14.0, *)
                {
                    //We are currently allowing there to be trailing spaces after comments, need to auto remove those from the comment
                    //object before we actually let it be submitted
                    TextEditor(text: $textLimiter.comment_content)
                        .onTapGesture {
                            if !self.commentBoxPressed{
                                textLimiter.comment_content = " "
                                self.commentBoxPressed = true
                            }
                        }
                        .multilineTextAlignment(.leading)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        .background(Color.white)
                        .cornerRadius(25)
                        .foregroundColor(commentBoxPressed ? Color.black : Color.gray)
                        .listRowBackground(Color(red: 0 / 255, green: 255 / 255, blue: 255 / 255))
                    
                }
                Button(action:
                {
                    let commentObject: [String: Any]  =
                        [
                            "post_id": post.post_id,
                            "content": textLimiter.comment_content,
                        ]
                    API().submitComment(submitted: commentObject)
                    self.presentationMode.wrappedValue.dismiss()
                    
                })
                {
                    Text("Submit")                        .fontWeight(.bold)
                        .padding(10)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .listRowBackground(Color(red: 0 / 255, green: 255 / 255, blue: 255 / 255))
            }
            .foregroundColor(Color.blue)
        
    }
}
