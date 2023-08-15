//
//  HomeTypeTest.swift
//  GamesTests
//
//  Created by ahmad shiddiq on 15/08/23.
//

@testable import Games
import XCTest

class HomeTypeTest: XCTestCase {
    
    func testValidationNavigationTitle() throws {
        let home = tabBarType.home
        XCTAssertEqual(home.navigationTitle, "Games For You")
    }
    
    func testValidationBarTitle() throws {
        let home = tabBarType.home
        XCTAssertEqual(home.tabTitle, "Home")
    }
}
