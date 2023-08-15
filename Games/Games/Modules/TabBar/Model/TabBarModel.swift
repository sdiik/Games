//
//  TabBarModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

enum tabBarType: String {
    case home
    case favorite
    
    var tabTitle: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorite"
        }
    }
    
    var navigationTitle: String {
        switch self {
        case .home:
            return "Games For You"
        case .favorite:
            return "Favorite Games"
        }
    }
}
