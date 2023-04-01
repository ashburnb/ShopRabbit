//
//  Brad_Ashburn_Shopping_AppUITests.swift
//  Brad_Ashburn_Shopping_AppUITests
//
//  Created by Brad Ashburn on 3/22/23.
//

import XCTest
@testable import Brad_Ashburn_Shopping_App

final class Brad_Ashburn_Shopping_AppUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    // sets up the app instance to be available to all tests
    app = XCUIApplication()
    app.launch()

    // stop tests upon UITest failure
    continueAfterFailure = false

    // device simulator is set to portrait
    var device = XCUIDevice.shared.orientation
    device = .portrait
    XCTAssertTrue(device.isPortrait)
  }

  override func tearDownWithError() throws {
    app = nil
  }

  func test_allTabButtonsInTabbar() throws {
    let tabBar = app.tabBars["Tab Bar"]
    let homeTab = tabBar.buttons["Home"]
    let itemsTab = tabBar.buttons["Items"]
    let cartTab = tabBar.buttons["Cart"]

    XCTAssertTrue(homeTab.exists)
    XCTAssertTrue(itemsTab.exists)
    XCTAssertTrue(cartTab.exists)
  }

  func test_addItemToCart() throws {
    let tabBar = app.tabBars["Tab Bar"]
    let itemsButton = tabBar.buttons["Items"]
    itemsButton.tap()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95"]/*[[".cells.buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]",".buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.scrollViews.otherElements.buttons["Add to cart"].tap()
    app.alerts["Added to Cart"].scrollViews.otherElements.buttons["OK"].tap()

    let cartButton = tabBar.buttons["Cart"]
    cartButton.tap()
    let itemAdded = app/*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"]/*[[".otherElements[\"1\"].collectionViews",".cells.staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/

    // Assert that the item was added to the shopping cart
    XCTAssertTrue(itemAdded.exists)
  }

  func test_ItemRemovedFromCartAfterOrderPlaced() throws {
    let tabBar = app.tabBars["Tab Bar"]
    let itemsButton = tabBar.buttons["Items"]
    itemsButton.tap()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95"]/*[[".cells.buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]",".buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.scrollViews.otherElements.buttons["Add to cart"].tap()
    app.alerts["Added to Cart"].scrollViews.otherElements.buttons["OK"].tap()

    let cartButton = tabBar.buttons["Cart"]
    cartButton.tap()

    let itemAdded = app/*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"]/*[[".otherElements[\"1\"].collectionViews",".cells.staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    itemAdded.tap()
    app/*@START_MENU_TOKEN@*/.buttons["Checkout"]/*[[".otherElements[\"1\"].buttons[\"Checkout\"]",".buttons[\"Checkout\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app/*@START_MENU_TOKEN@*/.collectionViews.buttons["Place Order"]/*[[".otherElements[\"1\"].collectionViews",".cells.buttons[\"Place Order\"]",".buttons[\"Place Order\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
    app.alerts["Order Confirmed"].scrollViews.otherElements.buttons["OK"].tap()

    cartButton.tap()
    app.navigationBars["Checkout"].buttons["Shopping Cart"].tap()

    // Assert that the item is removed from the shopping cart after the Place Order button is pressed
    XCTAssertFalse(itemAdded.exists)
  }

  func test_allCategoryGridItemsAppear() throws {
    app.tabBars["Tab Bar"].buttons["Items"].tap()

    let jewelryGridItem = app.buttons["Jewelry"]
    jewelryGridItem.tap()
    app.navigationBars["Jewelry"].buttons["Store Categories"].tap()

    let electronicsGridItem = app.buttons["Electronics"]
    electronicsGridItem.tap()
    app.navigationBars["Electronics"].buttons["Store Categories"].tap()

    let mensClothingGridItem = app.buttons["Men's Clothing"]
    mensClothingGridItem.tap()
    app.navigationBars["Men's Clothing"].buttons["Store Categories"].tap()

    let womensClothingGridItem = app.buttons["Women's Clothing"]
    womensClothingGridItem.tap()
    app.navigationBars["Women's Clothing"].buttons["Store Categories"].tap()

    // Assert that all four item categories from the fakeapistore are showing as grid tiles
    XCTAssertTrue(jewelryGridItem.exists)
    XCTAssertTrue(electronicsGridItem.exists)
    XCTAssertTrue(mensClothingGridItem.exists)
    XCTAssertTrue(womensClothingGridItem.exists)
  }

  func test_returnsToInventoryViewFromItemDetailViewWhenBackButtonPressed() throws {
    app.tabBars["Tab Bar"].buttons["Items"].tap()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95"]/*[[".cells.buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]",".buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    let itemDetailPrice = app.scrollViews.otherElements.staticTexts["$109.95"]

    // Assert that the ItemDetailView is shown when a List item is tapped
    XCTAssertTrue(itemDetailPrice.exists)
    app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Store Categories"].tap()

    // Assert that the ItemDetailView is removed when navigating back to InventoryView
    XCTAssertFalse(itemDetailPrice.exists)
  }

  func test_removeItemFromShoppingCart() throws {
    app.tabBars["Tab Bar"].buttons["Items"].tap()
    app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95"]/*[[".cells.buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]",".buttons[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops, $109.95\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    app.scrollViews.otherElements.buttons["Add to cart"].tap()
    app.alerts["Added to Cart"].scrollViews.otherElements.buttons["OK"].tap()
    app.tabBars["Tab Bar"].buttons["Cart"].tap()

    app/*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"]/*[[".otherElements[\"1\"].collectionViews",".cells.staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".staticTexts[\"Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()

    let collectionViewsQuery = app/*@START_MENU_TOKEN@*/.collectionViews/*[[".otherElements[\"1\"].collectionViews",".collectionViews"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    let listItemAdded = collectionViewsQuery.cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element
    listItemAdded.swipeLeft()

    // Assert that an item is added to the shopping cart
    XCTAssertTrue(listItemAdded.exists)
    collectionViewsQuery.buttons["Delete"].tap()

    // Assert that the item that was added has now been removed after delete button pressed
    XCTAssertFalse(listItemAdded.exists)
  }

} // end of UI Tests
