//
//  UserProfile.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 26/11/22.
//

import Foundation

class UserProfile{
    var uid:String
    var BPM:String
    var Systole:String
    var Diastole:String
    
    init(uid: String, BPM:String, Systole: String, Diastole: String) {
        self.uid = uid
        self.BPM = BPM
        self.Systole = Systole
        self.Diastole = Diastole
    }
}
