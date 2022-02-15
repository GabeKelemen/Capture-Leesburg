import Foundation
import Firebase
import FirebaseFirestore

class TourGuideViewListModel: ObservableObject {
    
    @Published var list = [Guide]()
    
    init(){
        getData()
    }
    
    func getData() {
        
        let db = Firestore.firestore()
        
        db.collection("guide").getDocuments {snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map {d in
                            
                            return Guide (
                                // wont connect           id:
                                name: d["name"] as? String ?? "",
                                specialty: d["specialty"] as? String ?? "",
                                
                                image_url: d["image_url"] as? String ?? "",
                                description: d["description"] as? String ?? ""
                            )
                        }
                    }
                }
            }
        }
    }
}

