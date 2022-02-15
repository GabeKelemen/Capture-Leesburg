import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack {
            Image("capture")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Capture Leesburg").font(.system(size: 35, weight: .semibold))
                .foregroundColor(.green)
                .padding()
            
            Text("Welcome to Our Town")
                .font(.system(size: 23, weight: .semibold))
            //                        .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .lineLimit(nil)
                .padding(.top, 30)
            
            Text("Here's how you can explore our local history")
                .font(.system(size: 15, weight: .medium))
            //                        .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .lineLimit(nil)
                .padding(.all, 20)
                .padding(.horizontal, 20)
            
            NavigationLink(destination: SiteListView()){
                Text("Leesburg Sites")
                    .bold()
                    .font(.caption)
                    .frame(width: 280, height: 40)
                    .background(Color(.systemGreen))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: MapView()){
                Text("Map of Leesburg Sites")
                    .bold()
                    .font(.caption)
                    .frame(width: 280, height: 40)
                    .background(Color(.systemGreen))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: GuideListView()){
                Text("Hire a Local Guide")
                    .bold()
                    .font(.caption)
                    .frame(width: 280, height: 40)
                    .background(Color(.systemGreen))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination:LandingView()){
                Text("Launch AR View")
                    .bold()
                    .font(.caption)
                    .frame(width: 280, height: 40)
                    .background(Color(.systemGreen))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .opacity(0.3)
            }
            Spacer()
        }.background(Color.black)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}






