//
//  SaveDataTest.swift
//  GamesTests
//
//  Created by ahmad shiddiq on 15/08/23.
//

import XCTest
@testable import Games

class SaveDataTest: XCTestCase {

    func testSaveData() throws {
        let favoriteId = 2
        FavoritesSaved.setFavoriteIds(with: favoriteId)
        XCTAssertTrue(FavoritesSaved.isAlreadyFavoriteId(id: favoriteId))
    }
    
    func testRemoveData() throws {
        let favoriteId = 2
        FavoritesSaved.removeFavoriteId(id: favoriteId)
        XCTAssertFalse(FavoritesSaved.isAlreadyFavoriteId(id: favoriteId))
    }
    
    func testGetData() throws {
        FavoritesSaved.removeAllFavorites()
        let favoriteOne = 1
        let favoriteTwo = 2
        let favoriteThree = 3
        
        FavoritesSaved.setFavoriteIds(with: favoriteOne)
        FavoritesSaved.setFavoriteIds(with: favoriteTwo)
        FavoritesSaved.setFavoriteIds(with: favoriteThree)
        
        XCTAssertEqual(FavoritesSaved.getFavoriteIds(), [1,2,3])
        
    }
}
