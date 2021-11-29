import SwiftUI
import SlideOverCard
import UIKit

extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

public extension UIDevice {

    /// pares the deveice name as the standard name
    var modelName: String {

        #if targetEnvironment(simulator)
            let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") { identifier, element in
                guard let value = element.value as? Int8, value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        #endif

        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPod9,1":                                 return "iPod touch (7th generation)"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone12,1":                              return "iPhone 11"
        case "iPhone12,3":                              return "iPhone 11 Pro"
        case "iPhone12,5":                              return "iPhone 11 Pro Max"
        case "iPhone12,8":                              return "iPhone SE (2nd generation)"
        case "iPhone13,1":                              return "iPhone 12 mini"
        case "iPhone13,2":                              return "iPhone 12"
        case "iPhone13,3":                              return "iPhone 12 Pro"
        case "iPhone13,4":                              return "iPhone 12 Pro Max"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,11", "iPad8,12":                    return "iPad Pro (12.9-inch) (4th generation)"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        default:                                        return identifier
        }
    }
}

struct UserProfileView: View {
    @State var posts: [Post] = []
    @State var postCount = 0
    @State private var username: String = UserDefaults.standard.string(forKey: defaultsKeys.username)!
    @State private var showingChildView = false
    @EnvironmentObject var categoryGlobal: Category
    let categorySettings = Category()
    
    var body: some View {
        let count = self.posts.count
        let deviceType = UIDevice.current.modelName
        ScrollView{
        if #available(iOS 14.0, *) {
            ZStack(alignment: .top){
                
                VStack
                {
                    
                    NavigationLink("User Settings", destination: UserSettingsView(profileUsername: $username).environmentObject(categoryGlobal).environmentObject(categorySettings),
                                   isActive: self.$showingChildView)
                    Text(username)
                        .font(.system(size:42))
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.black, radius: 3, y:1)
                        .padding(.top, -UIScreen.main.bounds.height * 0.175)
                    
                    Text(String(count) + " Bubbles")
                        .font(.system(size:28))
                        .font(.headline)
                        .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                        .bold()
                        .padding(.top, -UIScreen.main.bounds.height * 0.075)
                    
                    List(posts){ post in
                        
                        UserCreatedPostView(post: post)
                    }

                    .colorMultiply(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .buttonStyle(PlainButtonStyle())
                    .onAppear
                    {
                        API().getUserCreatedPosts
                        { (result) in
                            switch result
                            {
                                case .success(let posts):
                                    print(deviceType)
                                    self.posts = posts
                                case .failure(let error):
                                    print(error)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
                .buttonStyle(PlainButtonStyle())
                
                
            }.background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
            .onAppear(){
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
            }
        } else {
            // Fallback on earlier versions
            }
        }//end ScrollView
        .background(Color(red: 112 / 255, green: 202 / 255, blue: 211 / 255))
        .edgesIgnoringSafeArea(.bottom) //Set title to none so that it won't put the bottom title
        .navigationBarItems(trailing: Button(action:{ self.showingChildView = true }) {
                                Image(systemName: "gearshape").resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.width * 0.06)
                                    .foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255) )})
//                NavigationLink(destination: UserSettingsView(profileUsername: $username).environmentObject(categoryGlobal).environmentObject(categorySettings)){
//                    Image(systemName: "gearshape").resizable().frame(width: UIScreen.main.bounds.width * 0.06, height: UIScreen.main.bounds.width * 0.06).foregroundColor(Color(red: 43 / 255, green: 149 / 255, blue: 173 / 255))
                
           // })
    }
}
