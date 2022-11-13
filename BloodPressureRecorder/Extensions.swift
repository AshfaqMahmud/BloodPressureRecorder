//
//  Extensions.swift
//  BloodPressureRecorder
//
//  Created by Ashfaq on 13/11/22.
//

import Foundation
import SwiftUI

extension UIViewController {
    func handleFireBaseAuthError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
