//
//  RecordInsert.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI

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
                    
                    Button("Add Record"){
                        
                    }
                    .foregroundColor(.black)
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
