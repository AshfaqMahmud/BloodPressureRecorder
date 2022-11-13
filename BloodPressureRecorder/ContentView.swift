//
//  ContentView.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userLoggedIn = DataBaseModel()
    var body: some View {
        if !userLoggedIn.signInSuccess {
            Login()
        }
        else {
            DemoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
