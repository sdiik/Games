//
//  GameListDataModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct GameListDataModel: Codable {
    let gameList: [GameItemDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case gameList = "results"
    }
}
