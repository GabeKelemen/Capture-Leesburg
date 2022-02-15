//import SwiftUI
//import FirebaseAuth
//import FirebaseFirestore
//import FirebaseFirestoreSwift
//
//struct LogInScreenView: View {
//    @State var email = ""
//    @State var password = ""
//    
//    @EnvironmentObject var viewModel: LoginViewModel
//
//    var body: some View {
//        ZStack {
//            VStack {
//                Spacer()
//                Image("capture")
//                               .resizable()
//                               .scaledToFit()
//                               .frame(height: 125)
//                Text("Log In").font(.system(size: 25, weight: .semibold))
//                               .foregroundColor(.green)
//                               .padding()
//                VStack {
//                    TextField("Email address", text: $email)
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .font(.title3)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .padding(.vertical)
//                    
//                    SecureField("Password", text: $password)
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .font(.title3)
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .padding(.vertical)
//                }
//                .padding()
//                
//                Button {
//                    guard !email.isEmpty, !password.isEmpty else {
//                        return
//                    }
//                    viewModel.signIn(email: email, password: password)
//                } label: {
//                    Text("Log In")
//                        .font(.title3)
//                        .fontWeight(.bold)
//                        .foregroundColor(Color.white)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                        .padding(.vertical)
//                }
//                Spacer()
//            }
//            .background(Color.black)
//            .navigationTitle("")
//        }
//    }
//}
