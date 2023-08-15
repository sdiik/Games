//
//  GameListApiFactory.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

protocol GameListApiFactory {
    func createGameListUrl(pageNumber: Int?, pageSize: Int?, keyword: String?) -> URLComponents
}
