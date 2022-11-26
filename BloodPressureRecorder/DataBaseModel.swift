//
//  DataBaseModel.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class DataBaseModel: ObservableObject{
    let auth = Auth.auth()
    @Published var signInSuccess = false
    
    //signup function for firestore called automatically
    func signUp(email: String, password: String)
    {
        auth.createUser(withEmail: email, password: password)
        {
            result, error in guard result != nil, error == nil else{
                return
            }
        }
    }
    
    //signin function
    func signIn(email: String, password: String)
    {
        auth.signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                debugPrint(error.localizedDescription)
                //self.handleFireBaseAuthError (error : error)
                //self.activityIndicator.stopAnimating()
            }
            else
            {
                print("Logged In!")
                self.signInSuccess = true
            }
        }
    }
    
    //main registration function and its necessary variables for realtime database
    let ref = Database.database().reference()
    //main registration function
    func register(fullname: String, email: String, age: String, password: String, phone: String, gender: String)
    {
        ref.child("users").child(phone).child("Fullname").setValue(fullname)
        ref.child("users").child(phone).child("Password").setValue(password)
        ref.child("users").child(phone).child("Age").setValue(age)
        ref.child("users").child(phone).child("Gender").setValue(gender)
        ref.child("users").child(phone).child("Email").setValue(email)
    }
}
import Foundation

 
class userViewModel: ObservableObject {
     
    @Published var users = [User]()
     
    private var ref = Database.database().reference().child("users details")
     
    func fetchData() {
    
        /*ref.observeSingleEvent(of: .value, with: {(snapshot: DataSnapshot) in
              if let result = snapshot.children.allObjects as? [DataSnapshot] {
                for child in result {
                  let orderID = child.key
                  self
                    .ref
                    .child(orderID)
                    .queryOrdered(byChild: "score")
                    .observeSingleEvent(of: .value, with: {(snapshot: DataSnapshot) in
                      let value = snapshot.value as? NSDictionary
                      self.users.append(
                        User(id: value?["id"] as? String ?? UUID().uuidString,
                               username: value?["username"] as? String ?? "",
                               score: value?["score"] as? Int ?? 0))
                    })
                }

        
        
        
        
        
        
        
        
        
        
        
        db.child("users details/\(1)").addSnapshotListener { snapshot in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }
             
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let surname = data["surname"] as? String ?? ""
                //return User(name: name, surname: surname)
            }
        }*/
    }
}
