import SwiftUI

struct AnotherARView: View {
    
    @State var isARTapped = false
    
    var body: some View {
        
        VStack(alignment: .center) {
            NavigationLink(destination: arView()) {
            }
            
            VStack(alignment: .leading) {
                
                Text("click for AR view")
                    .font(.system(size: 22))
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding([.leading, .bottom], 10.0)
            }
            .frame(minWidth: 0, maxWidth: UIScreen.main.bounds.width)
            .edgesIgnoringSafeArea(.all)
            //            .onTapGesture {
            //                isARTapped.toggle()
            //            }
            //                NavigationLink("", destination: LandingView(), isActive: $isARTapped)
            //                    }
            
            .edgesIgnoringSafeArea(.all)
            .navigationViewStyle(StackNavigationViewStyle())
            
        }
        
    }
}
