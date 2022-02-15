import SwiftUI
import Firebase

struct SiteListView: View {
    
    @ObservedObject var model = SiteListViewModel()
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text("Leesburg Sites")
                .foregroundColor(.white)
                .padding()
                .font(.system(size: 25, weight: .semibold))
            
            Spacer()
            
            List(model.list) { site in
                HStack{
                    NavigationLink(destination: SiteDetailView(site: site))
                    {
                        AsyncImage(url: URL(string: site.image_url)){ image in
                            image.resizable()
                        } placeholder: {
                            Color.green
                        }
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                        
                        Text(site.name)
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

struct SiteListView_Previews: PreviewProvider {
    static var previews: some View {
        SiteListView()
    }
}


