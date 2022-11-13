//
//  Registration.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase

struct Registration: View {
    //insert variables
    @State private var password=""
    @State private var cpassword=""
    @State private var email=""
    @State private var fullname=""
    @State private var age=""
    @State private var selectedgender="Male"
    @State private var phone=""
    
    //@EnvironmentObject var viewmodel : DataBaseModel
    
    //gender picker
    private let gender: [String] = [
        "Male",
        "Female",
        "Other"
    ]
    
    
    
    var body: some View {
        ZStack{
            Color.black
            RoundedRectangle(cornerRadius: 1, style: .continuous)
                .foregroundStyle(.blue)
                .frame(width: 1000,height: 450)
                .rotationEffect(.degrees(135))
                .offset(y: 350)
            VStack(spacing: 15){
                Text("Registration")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Fullname", text: $fullname) //fullname
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                TextField("Email", text: $email) //email
                    .padding()
                    .keyboardType(.emailAddress)
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                Picker(selection: $selectedgender) {
                    ForEach(gender, id: \.self) { gender in
                        Text(gender)
                        
                    }
                } label: {
                    Text("Select Gender")
                        .foregroundColor(.black)
                }
                .accentColor(Color.black.opacity(0.5))
                .pickerStyle(.menu)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.white.opacity(1))
                .cornerRadius(10)
                TextField("Age", text: $age) //username
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                TextField("Phone", text: $phone) //phone
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password) //password
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                SecureField("Confirm Password", text: $cpassword) //confirm password
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                Button(action: {
                    if(!fullname.isEmpty && !email.isEmpty && !password.isEmpty && !cpassword.isEmpty && !age.isEmpty && !phone.isEmpty)
                    {
                        //viewmodel.register(fullname: fullname, email: email, age: age, password: password, phone: phone, gender: selectedgender)
                        //viewmodel.signUp(email: email, password: password)
                        let auth = Auth.auth()
                        auth.createUser(withEmail: email, password: password)
                        {
                            result, error in guard result != nil, error == nil else{
                                return
                            }
                        }
                        let ref = Database.database().reference()
                        ref.child("users").child(phone).child("Fullname").setValue(fullname)
                        ref.child("users").child(phone).child("Password").setValue(password)
                        ref.child("users").child(phone).child("Age").setValue(age)
                        ref.child("users").child(phone).child("Gender").setValue(selectedgender)
                        ref.child("users").child(phone).child("Email").setValue(email)
                    }
                },label: {
                    Text("Submit")
                })
                .foregroundColor(.white)
                .frame(width:150 ,height: 50)
                .background(Color.black)
                .cornerRadius(10)
                
            }
        }
        .ignoresSafeArea()
        //.environmentObject(viewmodel)
        
    }
    
    
    struct Registration_Previews: PreviewProvider {
        static var previews: some View {
            Registration()
        }
    }
}
