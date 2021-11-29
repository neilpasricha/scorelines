import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Override point for customization after application launch
        let initialDefaults: NSDictionary =
        [
            "username": "username",
            "user_id": Constants.DEFAULT_USER_ID,
            "user_type": Constants.DEFAULT_USER_TYPE,
            "password": "password",
            "email": "email",
            "date_joined": "date_joined",
            "default_category_id": Constants.DEFAULT_CATEGORY,
            "token": "",
            "radius": 1000,
        ]
        UserDefaults.standard.register(defaults: initialDefaults as! [String : Any])
        UINavigationBar.appearance().barTintColor = UIColor(red:0.439, green:0.792, blue:0.827, alpha:1)//changes navigation bar up top
        UITabBar.appearance().barTintColor = UIColor(red:0.439, green:0.792, blue:0.827, alpha:1) //changes tab bar at bottom
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
