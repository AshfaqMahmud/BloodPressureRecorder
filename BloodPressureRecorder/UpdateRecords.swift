//
//  UpdateRecords.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI

struct UpdateRecords: View {
    //declare variables
    @State private var systole = ""
    @State private var diastole = ""
    @State private var bpm = ""
    @State private var comment = ""
    
    
    //create view of the page
    var body: some View {
        NavigationView{
            ZStack{                                     //for background
                Color(.blue)
                VStack(spacing:40){
                    Text("Update Record")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    VStack (spacing: 15){                   //linearlayout horizontal
                        
                        TextField("Systole", text: $systole)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(red: 50/255,green: 200/255,blue: 250/255).opacity(1))
                            .cornerRadius(10)
                        TextField("Diastole", text: $diastole)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(red: 50/255,green: 200/255,blue: 250/255).opacity(1))
                            .cornerRadius(10)
                        TextField("BPM", text: $bpm)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(red: 50/255,green: 200/255,blue: 250/255).opacity(1))
                            .cornerRadius(10)
                        TextField("Comment", text: $comment)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color(red: 50/255,green: 200/255,blue: 250/255).opacity(1))
                            .cornerRadius(10)
                    }
                    VStack(spacing: 15){
                        
                        Button("Update Record"){
                            
                        }
                        .foregroundColor(.white)
                        .frame(width:200 ,height: 50)
                        .background(Color(red: 140/255,green: 2/255,blue: 20/255).opacity(1))
                        .cornerRadius(10)
                        
                        NavigationLink(destination: Registration() , label: {
                            Text("View Records")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color(red: 0/255,green: 180/255,blue: 40/255).opacity(1))
                                .cornerRadius(10)
                        })
                    }
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

struct UpdateRecords_Previews: PreviewProvider {
    static var previews: some View {
        UpdateRecords()
    }
}
