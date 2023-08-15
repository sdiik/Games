//
//  TabBarViewController.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationControllers()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.background
        tabBar.tintColor = Colors.tab
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [TabBarViewController.self])
        appearance.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: Colors.tab as Any],
            for: .normal)
        appearance.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: Colors.tabSelected as Any],
            for: .selected)
    }
    
    private func setupNavigationControllers() {
        viewControllers = [
            createNavController(
                for: HomeViewController(),
                title: .home,
                image: Images.Assets.home!,
                imageSelected: Images.Assets.homeSelected!
            ),
            createNavController(
                for: FavoriteViewController(),
                title: .favorite,
                image: Images.Assets.favorite!,
                imageSelected: Images.Assets.favoriteSelected!
            )
        ]
    }
    
    fileprivate func createNavController(
        for rootViewController: UIViewController,
        title: tabBarType,
        image: UIImage,
        imageSelected: UIImage
    ) -> UIViewController {
        let navController = showNavigationBar(controller: rootViewController)
        navController.tabBarItem.title = title.tabTitle
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = imageSelected
        rootViewController.navigationItem.title = title.navigationTitle
        return navController
    }
}
