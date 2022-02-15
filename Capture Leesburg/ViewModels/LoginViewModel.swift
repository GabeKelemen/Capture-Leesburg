//import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//
//class LoginViewModel: ObservableObject {
//    var userViewModel = UserModel()
//    var signUpView = RegisterView()
//    var uid = ""
//    var user:  FirebaseAuth.User?
//    @Published var signedIn = false
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
//
//    let auth = Auth.auth()
//
//    func signIn(email: String, password: String) {
//        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                self?.signedIn = true
//                self?.user = result?.user
//            }
//        }
//    }
//
//    func signUp(email: String, password: String, completion: @escaping(FirebaseAuth.User?) -> Void) {
//        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            completion(result?.user)
//            DispatchQueue.main.async {
//                self?.signedIn = true
//                self?.user = result?.user
//            }
//        }
//    }
//
//    func signOut()  {
//        try? auth.signOut()
//        self.signedIn = false
//
//        self.user = nil
//    }
//}
