//
//  RecordInsert.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase
struct RecordInsert: View {
    @State private var systole = ""
    @State private var diastole = ""
    @State private var bpm = ""
    @State private var comment = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.red
                VStack (spacing: 25){
                    Text("Insert Record")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .bold()
                    TextField("Systole", text: $systole)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.orange.opacity(1))
                        .cornerRadius(10)
                    TextField("Diastole", text: $diastole)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.orange.opacity(1))
                        .cornerRadius(10)
                    TextField("BPM", text: $bpm)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.orange.opacity(1))
                        .cornerRadius(10)
                    TextField("Comment", text: $comment)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.orange.opacity(1))
                        .cornerRadius(10)
                    
                    Button(action: {
                        
                        let user = Auth.auth().currentUser
                        var coun : UInt = 0
                        var count = ""
                        
                        if let user = user
                        {
                            //viewmodel.register(fullname: fullname, email: email, age: age, password: password, phone: phone, gender: selectedgender)
                            //viewmodel.signUp(email: email, password: password)
                            let uid  = user.uid
                            let ref = Database.database().reference().child("users details").child(uid)
                            ref.observeSingleEvent(of: .value, with: {snapshot in
                                    coun += snapshot.childrenCount
                                count = String(coun)
                                ref.child(count).child("Systole").setValue(systole)
                                ref.child(count).child("Diastole").setValue(diastole)
                                ref.child(count).child("BPM").setValue(bpm)
                                ref.child(count).child("Comment").setValue(comment)
                                })
                            
                            
                        }
                    },label: {
                        Text("Add Record")
                    })                    .foregroundColor(.black)
                    .frame(width:200 ,height: 50)
                    .background(Color.yellow.opacity(1))
                    .cornerRadius(10)
                    
                    //.navigate(to: Registration(), when: $showRegistrationView)
                    //NavigationLink("", destination: Registration, isActive: $showRegistrationView)
                    NavigationLink(destination: UpdateRecords(), label: {
                        Text("View Records")
                            .foregroundColor(.black)
                            .frame(width: 200, height: 50)
                            .background(Color.orange.opacity(1))
                            .cornerRadius(10)
                    })
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

struct RecordInsert_Previews: PreviewProvider {
    static var previews: some View {
        RecordInsert()
    }
}
