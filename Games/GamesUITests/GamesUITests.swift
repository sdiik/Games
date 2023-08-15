//
//  GamesUITests.swift
//  GamesUITests
//
//  Created by ahmad shiddiq on 15/08/23.
//

import XCTest

final class GamesUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testRunningGames() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Release date 2007-10-09").element/*[[".cells.containing(.staticText, identifier:\"Portal\").element",".cells.containing(.staticText, identifier:\"4.51\").element",".cells.containing(.staticText, identifier:\"Release date 2007-10-09\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        let tabBar = app.tabBars["Tab Bar"]
        let favoriteButton = tabBar.buttons["Favorite"]
        favoriteButton.tap()
        
        let homeButton = tabBar.buttons["Home"]
        homeButton.tap()
        
        let releaseDate20180420Cell = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Release date 2018-04-20").element/*[[".cells.containing(.staticText, identifier:\"God of War (2018)\").element",".cells.containing(.staticText, identifier:\"4.58\").element",".cells.containing(.staticText, identifier:\"Release date 2018-04-20\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        releaseDate20180420Cell.tap()
        
        let detailNavigationBar = app.navigationBars["Detail"]
        let iconHeartButton = detailNavigationBar.buttons["icon heart"]
        iconHeartButton.tap()
        let iconBackButton = detailNavigationBar.buttons["icon back"]
        iconBackButton.tap()
        
        favoriteButton.tap()
        releaseDate20180420Cell.tap()
        iconHeartButton.tap()
        iconBackButton.tap()
        
        homeButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"Release date 2016-05-13").element/*[[".cells.containing(.staticText, identifier:\"DOOM (2016)\").element",".cells.containing(.staticText, identifier:\"Release date 2016-05-13\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        iconHeartButton.tap()
        iconBackButton.tap()
        
        favoriteButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
                        measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
