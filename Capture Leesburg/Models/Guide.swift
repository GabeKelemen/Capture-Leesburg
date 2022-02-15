import Foundation
import SwiftUI

struct Guide: Identifiable {
    let id = UUID()
    let name: String
    let specialty:  String
    let image_url:  String
    let description: String
}
