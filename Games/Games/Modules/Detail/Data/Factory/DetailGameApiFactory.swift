//
//  DetailGameApiFactory.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

protocol DetailGameApiFactory {
    func createGameDetailUrl(with idGame: Int) -> URLComponents
}
