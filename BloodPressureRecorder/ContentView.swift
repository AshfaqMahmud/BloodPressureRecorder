//
//  ContentView.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI


struct ContentView: View {
    //@StateObject var userLoggedIn = DataBaseModel()
    @State var isLoggedIn : Bool = false
    
    //sharedprefences or userdefaults to get the login state
    let defaults = UserDefaults.standard
    var status : Bool {
        get {
            return defaults.bool(forKey: "loggedIn")
        }
    }
    var body: some View {
        
        //isLoggedIn for changing view
        //status for saving login status
        
        if !isLoggedIn && !status {
            Login(isLoggedIn: $isLoggedIn)
        }
        else {
            
            DemoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
