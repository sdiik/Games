//
//  DetailGameApiFactoryImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct DetailGameApiFactoryImpl: DetailGameApiFactory {
    func createGameDetailUrl(with idGame: Int) -> URLComponents {
        var components = URLComponents()
        components.scheme = API_SCHEME
        components.host = API_HOST
        components.path = "/api/games/\(idGame)"
        components.queryItems = [URLQueryItem(name: "key", value: API_KEY)]
        return components
    }
}
