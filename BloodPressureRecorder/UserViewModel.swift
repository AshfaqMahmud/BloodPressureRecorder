//
//  UserViewModel.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 26/11/22.
//
import Foundation
import FirebaseFirestore
import FirebaseDatabase
import FirebaseAuth

class UserViewModel: ObservableObject {
    
    @Published var users = [User2]()
    private var db = Firestore.firestore()
    var uid = ""
    func fetchdata() {
        let defaults = UserDefaults.standard
        
        var user = Auth.auth().currentUser
        if let user = user {
            uid = user.uid
        }
        
        db.collection(uid).addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Record")
                return
            }
            self.users = documents.map { (queryDocumentSnapshot) -> User2 in
                let data = queryDocumentSnapshot.data()
                let systole = data["Systole"] as? String ?? ""
                let diastole = data["Diastole"] as? String ?? ""
                let bpm = data["BPM"] as? String ?? ""
                let comment = data["Comment"] as? String ?? ""
                return User2(systole: systole, diastole: diastole, bpm: bpm, comment: comment)
            }
            
        }
    }
   
   /* var ref = Database.database().reference().child("users details")
    
    @Published var listObject = [ObjectDemo]()
    
    @Published var value: String? = nil
    
    @Published var object: ObjectDemo? = nil
    
    
    func readValue(){
        //var child = ref.child("KeyA")
        ref.child("KeyA").observeSingleEvent(of: .value){ snapshot in
            self.value = snapshot.value as? String
        }
    }
    
    
    func readObject(){
        ref.child("22BbHlpGBWO2Kg7ZAX6yN0gcLIi1").child("0")
            .observe(.value) { snapshot in
                do{
                    self.object = try (snapshot.data(as: ObjectDemo.self))
                }catch {
                    print("cannot  do it")
                }
            }
    }
    
    /*func observeList(){
        ref.observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as?  [DataSnapshot] else{
                return
            }
            self.listObject = children.compactMap({ snapshot in
                return try? snapshot.data(as: ObjectDemo.self)
            })
        }
    }*/
    
    
  
 /* func fetchData() {
    ref.observeSingleEvent(of: .value, with: {(snapshot: DataSnapshot) in
      if let result = snapshot.children.allObjects as? [DataSnapshot] {
        for child in result {
            let uid = "22BbHlpGBWO2Kg7ZAX6yN0gcLIi1"
          let orderID = child.key
          self
            .ref
            .child(uid)
            //.child(orderID)
            .observeSingleEvent(of: .value, with: {(snapshot: DataSnapshot) in
              let value = snapshot.value as? NSDictionary
              self.users.append(
                User(id: value?["id"] as? String ?? orderID,
                     BPM: value?["BPM"] as? String ?? "",
                     Comment: value?["Comment"] as? String ?? "",
                     Systole: value?["Systole"] as? String ?? "",
                     Diastole: value?["Diastole"] as? String ?? ""))
                     
                       
            })
        }
      }
    })
  }*/ */
}
