//
//  StatusBar.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

import Foundation
import UIKit

func setupStatusBar() {
    UIApplication.shared.statusBarStyle = .lightContent
    if #available(iOS 13.0, *) {
        let statusBar = UIView(frame: UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
        statusBar.backgroundColor = Colors.blue
        statusBar.tintColor =  Colors.blue
        UIApplication.shared.keyWindow?.addSubview(statusBar)
    }
}
