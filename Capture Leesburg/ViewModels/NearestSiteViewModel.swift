import Foundation
import CoreLocation

final class NearestSiteViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var userLocation: CLLocation = CLLocation(latitude: 0, longitude: 0)
    @Published var nearestSite: String = ""
    @Published var allSites: [Site] = []
    
    
    let locationManager = CLLocationManager()
    
    override init () {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationAndFindNearestSite() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else {
            print("Unable to get latest location")
            return
        }
        DispatchQueue.main.async {
            self.userLocation = latestLocation
            self.findNearestSite(userLocation: latestLocation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func findNearestSite(userLocation: CLLocation) {
        self.makeAllSites()
        var minDistance: Double = 180
        for site in allSites {
            let distance: Double =
            sqrt(pow((trainStation.location.latitudeDouble - userLocation.coordinate.latitude), 2) + pow((trainStation.location.longitudeDouble - userLocation.coordinate.longitude), 2))
            // check for min distance
            if distance < minDistance {
                minDistance = distance
                self.nearestTrainStation = trainStation.station_name
            }
        }
    }
    
    func makeAllSites() {
//        if let url = Bundle.main.url(forResource: "CTALStops", withExtension: "json"),
           let data = pointsOfInterest
//            let decoder = JSONDecoder()
//            if let jsonData = try? decoder.decode(JSONData.self, from: data) {
//                let trainStationsDuplicates: [TrainStation] = jsonData.trainStops
//                // logic to remove duplicates
//                var prevTrainStationName: String = ""
//                for trainStation in trainStationsDuplicates {
//                    if (trainStation.station_name != prevTrainStationName) {
//                        self.allTrainStations.append(trainStation)
//                        prevTrainStationName = trainStation.station_name
//                    }
                }
            }
        }
    }
}
