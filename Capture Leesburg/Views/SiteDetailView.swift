import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI

struct SiteDetailView: View {
    @StateObject private var viewModel = MapViewModel()
    @ObservedObject private var distanceModel =  DistanceToSiteViewModel()
    @State private var showingAlert = false

 var site: Site
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: site.image_url)){ image in
                image.resizable()
            } placeholder: {
                Color.green
            }
            .frame(width: 130, height: 130)
            .scaledToFit()
            //
            Text(site.name)
                .font(.system(size: 30, weight: .semibold))
                .padding()
                .padding(.bottom, 5)
                .foregroundColor(.green)
            
            Text(site.description)
                .multilineTextAlignment(.leading)
                .font(.system(size: 15))
                .padding(.bottom, 15)
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            HStack{
                
                Image(systemName: "paperplane")
                    .font(.caption)
                    .padding(.bottom, 10)
                    .foregroundColor(.green)
                Link("Learn More about \(site.name)",
                     destination: URL(string: site.info_url)!)
                    .font(.caption)
                    .padding(.bottom, 20)
            }
            
            MapViewSingleSiteModel(site: site)
                .frame(width: 300, height: 300)
            
            VStack(spacing: 10) {
                
                HStack {
                    Image(systemName: "figure.walk").foregroundColor(.green)
                    
                    Button("Distance to \(site.name)") {
                        showingAlert = true
                        
                        distanceModel.findDistanceToSingleSite(userLocation: CLLocation(latitude: viewModel.region.center.latitude, longitude: viewModel.region.center.longitude), site: site)

                        
                        
                    }.alert(isPresented: $showingAlert){
                        Alert(title:
                                Text("Walking Distance"),
                              message: Text("You are within \(distanceModel.distanceToSingleSite, specifier: "%.0f") meters of \(site.name)"),
                              dismissButton: .cancel())
                        
                    }
                }.padding(.top, 10)
                    .padding(.bottom,10)
                    .font(.caption)
            }
            
            Spacer()
            
        }.background(Color.black)
            .edgesIgnoringSafeArea(.bottom)
    }
}


