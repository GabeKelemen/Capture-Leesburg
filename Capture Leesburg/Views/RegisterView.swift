//import SwiftUI
//import FirebaseAuth
//
//struct RegisterView: View {
//
//    @EnvironmentObject var loginViewModel: LoginViewModel
//
//    @State private var email: String = ""
//    @State private var password: String = ""
//    @StateObject private var registerVM = RegisterViewModel()
//
//    var body: some View {
//        VStack {
//            Text("Register").font(.system(size: 25, weight: .semibold))
//                .foregroundColor(.green)
//                .padding()
//            Image("capture")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .clipShape(Circle())
//                .padding(.bottom, 20)
//
//            TextField("Email", text: $email)
//                .padding(.bottom, 20)
//                .padding(.horizontal, 30)
//
//            SecureField("Password", text: $password)
//                .padding(.horizontal, 30)
//
//            Spacer()
//
//            Button(action: {
//                guard !email.isEmpty, !password.isEmpty else {
//                    return
//                }
//                loginViewModel.signUp(email: email, password: password)
//
//            }, label: {
//                    NavigationLink("Login", destination: LoginScreenView())
//                })
            
//            }, label: {
//                Text("Create Account")
//
//                //            }
//                    .buttonStyle(.plain)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal, 30)
//                //            .frame(maxWidth: .infinity)
//                    .background(Color.green)
//                    .cornerRadius(8)
//                    .foregroundColor(.white)
//                    .font(.system(size: 15, weight: .semibold))
//            })
            
//            Spacer()

//    }
