//
//  ObjectDemo.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 26/11/22.
//

import Foundation
class ObjectDemo: Encodable, Decodable{
    var BPM: String = ""
    var Comment: String = ""
    var Diastole: String = ""
    var Systole: String = ""
}

extension Encodable{
    var toDictionary: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options:  .allowFragments) as? [String: Any]
    }
}
