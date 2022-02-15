//import Foundation
//import SwiftUI
//import Firebase
//import FirebaseFirestore
//import FirebaseAuth
//
//
//class UserModel: ObservableObject {
//
//    @Published var currentUser : User?
//    @EnvironmentObject var userAuthInfo : LoginViewModel
//
//    init () {
//    }
//
//    func addUser(id: String,
//                 name: String)
//    {
//        let uid = Auth.auth().currentUser?.uid
//
//        let db = Firestore.firestore()
//
//        db.collection("users")
//            .document(uid ?? "None" as String).setData([
//                "name" : uid ?? "" as String
//            ]) { error in
//                if error == nil {
//                    self.getUser(uid: id)
//                }
//                else {
//                    print("Error")
//                }
//            }
//    }
//
//    func getUser(uid: String?) {
//        let db = Firestore.firestore()
//        let docRef = db.collection("users").document(uid ?? "" as String)
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                DispatchQueue.main.async {
//                    self.currentUser = User(
//                        id: document["name"] as? String ?? ""
//
//                        }
//                        else {
//                            print("error")
//                        }
//                        }
//                        }
//                        }
