//
//  User2.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 26/11/22.
//

import Foundation

struct User2: Identifiable {
    var id: String = UUID().uuidString
    var systole: String
    var diastole: String
    var bpm: String
    var comment: String
}
