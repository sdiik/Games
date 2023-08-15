//
//  GameListApiFactoryImpl.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct GameListApiFactoryImpl: GameListApiFactory {
    func createGameListUrl(pageNumber: Int?, pageSize: Int?, keyword: String?) -> URLComponents {
        var components = URLComponents()
        components.scheme = API_SCHEME
        components.host = API_HOST
        components.path = "/api/games"
        components.queryItems = []
        if let alreadyPageNumber = pageNumber {
            components.queryItems?.append(URLQueryItem(name: "page", value: "\(alreadyPageNumber)"))
        }
        if let alreadyPageSize = pageSize {
            components.queryItems?.append(URLQueryItem(name: "page_size", value: "\(alreadyPageSize)"))
        }
        if let alreadyKeyword = keyword, !alreadyKeyword.isEmpty {
            components.queryItems?.append(URLQueryItem(name: "search", value: alreadyKeyword))
        }
        components.queryItems?.append(URLQueryItem(name: "key", value: API_KEY))
        return components
    }
}
