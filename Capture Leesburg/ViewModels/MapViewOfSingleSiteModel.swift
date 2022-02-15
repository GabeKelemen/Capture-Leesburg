import SwiftUI
import CoreLocation
import MapKit

struct MapViewSingleSiteModel: View {
    
    @State private var viewModel = MapViewModel()
    @StateObject private var siteViewModel = SiteListViewModel()
    var site: Site
    @State var coordinates: (lat: Double, lon: Double) = (0,0)
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 30) {
                
                Map(coordinateRegion: $viewModel.region, interactionModes: MapInteractionModes.all,
                    showsUserLocation: true,
                    annotationItems: [site]) {
                    site in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: site.latitude, longitude: site.longitude), content:{Image(systemName: "mappin").foregroundColor(.pink)
                            .font(.system(size: 40, weight: .medium))
                        //                        Text(site.name).font(.system(size: 20, weight: .medium))
                    })
                }
                    .foregroundColor(.red)
                    .font(.headline)
                    .background(Color.black)
            }
        }
        .onAppear{
            viewModel.checkifLocationServicesIsEnabled()
        }
    }
}

