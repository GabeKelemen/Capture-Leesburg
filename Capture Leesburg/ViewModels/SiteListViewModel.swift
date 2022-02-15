import Foundation
import Firebase
import FirebaseFirestore

class SiteListViewModel: ObservableObject {
    
    @Published var list = [Site]()
    
    init(){
        getData()
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("sites").getDocuments {snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map {d in
                            
                            return Site(
                                //       wont connect           id:
                                imageName: d["imageName"] as? String ?? "",
                                name: d["name"] as? String ?? "",
                                description: d["description"] as? String ?? "",
                                info_url: d["info_url"] as? String ?? "",
                                latitude: d["latitude"] as? Double ?? 0,
                                longitude: d["longitude"] as? Double ?? 0,
                                image_url: d["image_url"] as? String ?? ""
                            )
                        }
                    }
                }
            }
        }
    }
}

