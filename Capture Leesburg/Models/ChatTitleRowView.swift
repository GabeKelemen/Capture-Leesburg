import SwiftUI

struct ChatTitleRowView: View {
    @State private var model = TourGuideViewListModel()
    
    var guide: Guide
    
    var body: some View {
        
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: guide.image_url)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading) {
                Text(guide.name)
                    .font(.subheadline).bold()
                    .foregroundColor(.white)
                Text("\(guide.specialty) Tours")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundColor(.green)
                .padding(10)
                .background(.black)
                .cornerRadius(50)
        }.padding()
    }
}
