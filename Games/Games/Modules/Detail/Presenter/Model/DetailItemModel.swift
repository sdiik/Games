//
//  DetailItemModel.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

struct DetailItemModel: Codable {
    let id: Int?
    let name: String?
    let imageUrl: String?
    let description: String?
    let released: String?
    let rating: Double?
    let playtime: Int?
    let platforms: [PlatformDataModel]?
    let publishers: [PublishedDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "background_image"
        case description
        case released
        case rating
        case platforms
        case playtime
        case publishers
    }
}
