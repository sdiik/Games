//
//  NavigationBar.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

func showNavigationBar(controller: UIViewController) -> UINavigationController {
    let navController = UINavigationController(rootViewController: controller)
    navController.navigationBar.barTintColor = Colors.blue
    navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navController.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    navController.navigationBar.backgroundColor =  Colors.blue
    navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navController.navigationBar.shadowImage = UIImage()
    return navController
}
