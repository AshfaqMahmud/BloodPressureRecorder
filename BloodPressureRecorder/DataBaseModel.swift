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
