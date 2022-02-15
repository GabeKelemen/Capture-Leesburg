import SwiftUI
import CoreLocation
import CoreLocationUI
import MapKit

final class DistanceToSiteViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    @Published var userLocation: CLLocation = CLLocation()
    
    @Published var nearestDistance: Double = 0
    @Published var distanceToSingleSite: Double = 0
    
    @Published var nearestSite: Site =  Site(imageName:  "", name:  "", description: "", info_url:  "", latitude:0, longitude: 0, image_url: "")

    @ObservedObject private var siteViewModel = SiteListViewModel()

    func findNearestSite(userLocation: CLLocation) {
        
        var shortestDistance: Double = 1000000
        var distancefeet = shortestDistance
        var nearest: Site
        
        for site in siteViewModel.list {
         
            let firstLocation = CLLocation(latitude: site.latitude, longitude: site.longitude)
            let secondLocation = CLLocation(latitude: userLocation.coordinate.latitude, longitude:  userLocation.coordinate.longitude)
            
            let distance = secondLocation.distance(from: firstLocation)
    
            if distance < shortestDistance {
                shortestDistance = distance
                distancefeet =  shortestDistance

//                3.28084
                //5280

                nearest = site

        self.nearestSite = site
        self.nearestDistance = distancefeet
            }
        }
    }
           
            
    func findDistanceToSingleSite(userLocation: CLLocation, site:Site) {
  
        let firstLocation = CLLocation(latitude: site.latitude, longitude: site.longitude)
        let secondLocation = CLLocation(latitude: userLocation.coordinate.latitude, longitude:  userLocation.coordinate.longitude)
        
        print(firstLocation)
        print(secondLocation)
            
       self.distanceToSingleSite = secondLocation.distance(from: firstLocation)
        
        print(self.distanceToSingleSite)
    
}
    }

