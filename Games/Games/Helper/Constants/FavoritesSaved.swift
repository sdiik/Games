//
//  FavoritesSaved.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation

class FavoritesSaved {
    
    static let defaults = UserDefaults.standard
    static let favoriteIdKey = "favoriteIdKey"
    
    static func setFavoriteIds(with id: Int) {
        if getFavoriteIds().isEmpty {
            let ids = [id]
            defaults.set(ids, forKey: FavoritesSaved.favoriteIdKey)
        } else {
            var ids = getFavoriteIds()
            ids.append(id)
            defaults.set(ids, forKey: FavoritesSaved.favoriteIdKey)
        }
    }
    
    static func getFavoriteIds() -> [Int] {
        guard let ids = defaults.array(forKey: FavoritesSaved.favoriteIdKey) as? [Int] else { return [] }
        return ids
    }
    
    static func removeAllFavorites() {
        var ids = getFavoriteIds()
        ids.removeAll()
        defaults.set(ids, forKey: FavoritesSaved.favoriteIdKey)
    }
    
    static func removeFavoriteId(id: Int) {
        if isAlreadyFavoriteId(id: id) {
            var ids = getFavoriteIds()
            if let alreadyId = ids.enumerated().first(where: { $0.element == id }) {
                ids.remove(at: alreadyId.offset)
                defaults.set(ids, forKey: FavoritesSaved.favoriteIdKey)
            }
        }
    }
    
    static func isAlreadyFavoriteId(id: Int) -> Bool {
        if getFavoriteIds().isEmpty {
            return false
        } else {
            let ids = getFavoriteIds()
            if ids.contains(id) {
                return true
            } else {
                return false
            }
        }
    }
}
