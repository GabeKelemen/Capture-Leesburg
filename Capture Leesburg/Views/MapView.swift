
//directions
import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @State private var viewModel = MapViewModel()
    @ObservedObject private var distanceModel =  DistanceToSiteViewModel()
    @State private var showingAlert = false
    @StateObject private var siteViewModel = SiteListViewModel()
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    
    
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 10) {
                
                Text("Leesburg Sites").bold()
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.thickMaterial)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.5), radius: 40, x:0, y: 15)
                
                Map(coordinateRegion: $viewModel.region, interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    annotationItems: siteViewModel.list) {
                    site in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: site.latitude, longitude: site.longitude)) {
                        
                        NavigationLink("\(site.name)") {
                            SiteDetailView(site: site)
                        }
                        .foregroundColor(.green)
                        .font(.headline)
                        .background(Color.black)
                    }
                    
                }
                    .onAppear{
                        viewModel.checkifLocationServicesIsEnabled()
                    }
                
                Button("Find Nearest Site") {
                    showingAlert = true
                    distanceModel.findNearestSite(userLocation: CLLocation(latitude: viewModel.region.center.latitude, longitude: viewModel.region.center.longitude))
                    
                    
                }.alert(isPresented: $showingAlert){
                    Alert(title:
                            Text("Closest Site: \(distanceModel.nearestSite.name)"),
                          message: Text("\(distanceModel.nearestSite.name) is within \(distanceModel.nearestDistance, specifier: "%.0f") meters walking distance of your location"),
                          dismissButton: .cancel())
                    
                }
            }.padding(.top, 40)
                .padding(.bottom,40)
                .font(.caption)
        }
    }
}
