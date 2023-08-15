//
//  GameItemDataModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct GameItemDataModel: Codable {
    let id: Int?
    let name: String?
    let backgroundImage: String?
    let released: String?
    var rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case backgroundImage = "background_image"
        case name
        case released
        case rating
    }
    
}
