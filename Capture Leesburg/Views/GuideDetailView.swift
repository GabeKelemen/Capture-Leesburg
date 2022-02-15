import SwiftUI

struct GuideDetailView: View {
    
    var guide: Guide
    
    var body: some View {
        
        VStack (spacing: 25) {
            
            AsyncImage(url: URL(string: guide.image_url)){ image in
                image.resizable()
            } placeholder: {
                Color.green
            }
            .frame(width: 200, height: 200)
            .scaledToFit()
            .padding(.top, 15)
            
            Text(guide.name)
                .font(.system(size: 30, weight: .semibold))
                .padding()
                .foregroundColor(.green)
            
            Text(guide.specialty)
                .font(.system(size: 20))
                .foregroundColor(.gray)
            
            Text(guide.description)
                .multilineTextAlignment(.leading)
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            NavigationLink(destination: ChatView(guide: guide)){
                Image(systemName: "message.circle.fill").foregroundColor(.green)
                Text("Chat with \(guide.name) to schedule a tour")
                    .foregroundColor(Color.green)
                    .font(.caption)
            }.padding()
        }.background(Color.black)
    }
}



