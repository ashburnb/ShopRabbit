//
//  Brad_Ashburn_Shopping_AppUITests.swift
//  Brad_Ashburn_Shopping_AppUITests
//
//  Created by Brad Ashburn on 3/22/23.
//

import XCTest

final class Brad_Ashburn_Shopping_AppUITests: XCTestCase {
  var app: XCUIApplication!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    app = XCUIApplication()
    app.launch()
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
  }
  
  func test_Example() throws {
    let cartButton = app.tabBars["Tab Bar"].buttons["Cart"]
    XCTAssertTrue(cartButton.exists)
  }
  
  func test_example2() {
    app.tabBars["Tab Bar"].buttons["Items"].tap()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95"]/*[[".cells.buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]",".buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    let addToCartButton = app.scrollViews.otherElements.buttons["Add to cart"]
//    app.alerts["Added to Cart"].scrollViews.otherElements.buttons["OK"].tap()
    XCTAssertTrue(addToCartButton.exists)
  }
  
  func test_example3() {
    
    let tabBar = app.tabBars["Tab Bar"]
    tabBar.buttons["Items"].tap()
    
    let electronicsButton = app.buttons["Electronics"]
    electronicsButton.tap()
    app.navigationBars["Electronics"].buttons["Store Categories"].tap()
    electronicsButton.tap()
    
    let collectionViewsQuery = app.collectionViews
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive, $114.00"]/*[[".cells.buttons[\"WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive, $114.00\"]",".buttons[\"WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive, $114.00\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin, $599.00"]/*[[".cells.buttons[\"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin, $599.00\"]",".buttons[\"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin, $599.00\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    let scrollViewsQuery = app.scrollViews
    scrollViewsQuery.otherElements.containing(.staticText, identifier:"Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin").element.swipeUp()
    
    
    XCTAssertTrue(electronicsButton.exists)
    XCTAssertTrue(tabBar.exists)
  }
  
  
  
}
