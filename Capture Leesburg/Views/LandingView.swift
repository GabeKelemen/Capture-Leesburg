import SwiftUI
import FirebaseAuth

struct LandingView: View {
    
    //    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        NavigationView {
            //            WelcomeView()
            //                .onAppear {
            //                    viewModel.signedIn = viewModel.isSignedIn
            //                }
            
            VStack {
                Image("capture")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Capture Leesburg").font(.system(size: 35, weight: .semibold))
                    .foregroundColor(.green)
                    .padding()
                
                Spacer()
                NavigationLink(destination: WelcomeView()){
                    Text("Login to Your Account")
                        .foregroundColor(Color.green)
                        .font(.system(size: 20, weight: .medium))
                        .frame(maxWidth: .infinity)
                }
                
                NavigationLink(destination: WelcomeView()){
                    Text("Create an Account")
                        .foregroundColor(Color.green)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5)
                }
                
                NavigationLink(destination: WelcomeView()){
                    Text("Browse as Guest")
                        .foregroundColor(Color.green)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 5)
                }
                
                Spacer()
            }.background(Color.black)
        }
    }
    
    struct LandingView_Previews: PreviewProvider {
        static var previews: some View {
            LandingView()
        }
    }
}
