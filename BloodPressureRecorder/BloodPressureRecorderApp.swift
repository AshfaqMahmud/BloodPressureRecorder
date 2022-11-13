//
//  BloodPressureRecorderApp.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

/*class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Colors application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
        FirebaseApp.configure()
        return true
    }
}*/
@main
struct BloodPressureRecorderApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    //@State var isInitializing: Bool = true
    //let viewmodel = DataBaseModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
