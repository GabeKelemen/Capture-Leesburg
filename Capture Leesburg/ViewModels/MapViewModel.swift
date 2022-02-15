import MapKit

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    //sets map area
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 39.114728, longitude: -77.566491), span: MKCoordinateSpan(latitudeDelta: 0.016, longitudeDelta: 0.016))
    
    
    var locationManager: CLLocationManager?
    
    func checkifLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self  // sets the delegate
        } else {
            print ("alert to turn on")
        }
    }
    
    //unwraps optional / checks authorization
    private func checklocationaAuthorization() {
        guard let locationManager = locationManager else { return }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("denied, check settings")
        case .authorizedAlways, .authorizedWhenInUse:
            if let coordinate = locationManager.location?.coordinate {
                
                region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.016, longitudeDelta: 0.016))  }
            
        @unknown default:
            break
        }
    }
    
    
    //delegate method
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checklocationaAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            return
        }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015))
        }
    }
    
}



