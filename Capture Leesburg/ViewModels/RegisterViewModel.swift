//import Foundation
//import Firebase
//import FirebaseAuth
//import SwiftUI
//
//class RegisterViewModel: ObservableObject {
//
//    var email: String = ""
//    var password: String = ""
//
//    let auth = Auth.auth()
//
//    @Published var signedIn = false
//
//    var isSignedIn: Bool {
//        return auth.currentUser != nil
//    }
//    
//    func signUp(email: String, password: String){
//        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self?.signedIn = true
//            }
//        }
//    }
//
//    func register(completion: @escaping () -> Void) {
//
//        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
//
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                completion()
//            }
//        }
//    }
//
//}

