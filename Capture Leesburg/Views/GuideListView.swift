import SwiftUI
import Firebase

struct GuideListView: View {
    
    @ObservedObject var model = TourGuideViewListModel()
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text("Leesburg Tour Guides")
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 25, weight: .semibold))
            
            Spacer()
            
            List(model.list) { guide in
                HStack{
                    NavigationLink(destination: GuideDetailView(guide: guide))
                    {
                        AsyncImage(url: URL(string: guide.image_url)){ image in
                            image.resizable()
                        } placeholder: {
                            Color.green
                        }
                        .frame(width: 50, height: 50)
                        .scaledToFit()
                        
                        Text(guide.name)
                    }
                }
            }
            .navigationBarTitle("")
            Divider()
            
            Text("")
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 25, weight: .semibold))
        }.background(Color.green)        
    }
    
    init() {
        model.getData()
    }
}

struct GuideListView_Previews: PreviewProvider {
    static var previews: some View {
        GuideListView()
    }
}


