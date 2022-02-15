import SwiftUI

struct Header: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .background(Color.blue)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            Image("profile")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}
