//
//  Login.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showRegistrationView = false
    
    //@EnvironmentObject var viewmodel : DataBaseModel
    var body: some View {
        
        NavigationView{
            ZStack {
                Color.blue
                RoundedRectangle(cornerRadius: 1, style: .continuous)
                    .foregroundStyle(.cyan)
                    .frame(width: 1000,height: 450)
                    .rotationEffect(.degrees(135))
                    .offset(y: 350)
                VStack (spacing: 25){
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(1))
                        .cornerRadius(10)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(1))
                        .cornerRadius(10)
                    
                    
                    
                    Button(action: {
                        if !email.isEmpty && !password.isEmpty
                        {
                            //viewmodel.signIn(email: email, password: password)
                            let auth = Auth.auth()
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
                                    //self.signInSuccess = true
                                }
                            }
                            DemoView()
                        }
                        //radius = 2000
                        
                    }, label: {
                        Text("Login")
                    })
                    .foregroundColor(.black)
                    .frame(width:200 ,height: 50)
                    .background(Color.yellow.opacity(1))
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Registration(), label: {
                        Text("New Here?")
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.red.opacity(1))
                            .cornerRadius(10)
                    })
                    
                }
                
            }
            .ignoresSafeArea()
            //.environmentObject(viewmodel)
            
        }
        
    }
}
    

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
