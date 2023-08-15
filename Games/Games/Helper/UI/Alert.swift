//
//  Alert.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import Foundation
import UIKit

class Alert {
    static func showMessage(with message: String, controller: UIViewController) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
