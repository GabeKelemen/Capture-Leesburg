import Foundation
import SwiftUI
import CoreLocation

struct Site: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let description:  String
    let info_url: String
    let latitude: Double
    let longitude: Double
    let image_url: String
}

