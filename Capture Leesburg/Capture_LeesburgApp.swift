import SwiftUI
import Firebase

@main
struct Capture_LeesburgApp: App {
    
//        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
           LandingView()
//            let loginViewModel = LoginViewModel()
//                       ContentView()
//                           .environmentObject(loginViewModel)
        
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//       func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//           FirebaseApp.configure()
//
//           return true
//       }
//   }

