//
//  Brad_Ashburn_Shopping_AppTests.swift
//  Brad_Ashburn_Shopping_AppTests
//
//  Created by Brad Ashburn on 3/22/23.
//

import XCTest
import SwiftUI
@testable import Brad_Ashburn_Shopping_App

final class BradAshburnShoppingAppTests: XCTestCase {

  func test_inventoryAndItemCategoryArraysCreated() {
    let inventoryVM = InventoryViewModel()
    let itemsInInventory = inventoryVM.inventory.isEmpty

    let itemsInJewelry = inventoryVM.jewelery.isEmpty
    let itemsInElectronics = inventoryVM.electronics.isEmpty
    let itemsInMensClothing = inventoryVM.mensclothing.isEmpty
    let itemsInWomensClothing = inventoryVM.womensclothing.isEmpty

    XCTAssertTrue(itemsInInventory)
    XCTAssertTrue(itemsInJewelry)
    XCTAssertTrue(itemsInElectronics)
    XCTAssertTrue(itemsInMensClothing)
    XCTAssertTrue(itemsInWomensClothing)
  }

  func test_noServerResponseWithInvalidURL() {
    // create a URL that will not exist
    // URL() returns an optional which must be unwrapped to run URLSession.shared.dataTask()
    let url = URL(string: "catscatscats")

    let expectation = expectation(description: "Server responds in reasonable time")
    defer { waitForExpectations(timeout: 2) }

    if let url = url {
      // URLSession runs a closure with data, response, and error
      URLSession.shared.dataTask(with: url) { data, response, error in
        defer { expectation.fulfill() }

        // Assert that data and response are nil
        XCTAssertNil(data)
        XCTAssertNil(response)

        // Assert that an error is not nil
        XCTAssertNotNil(error)
      }
      .resume() // runs the URLSession method
    }
  }

  func test_decode_items() {
    let url = URL(string: "https://fakestoreapi.com/products")

    let expectation = expectation(description: "Server responds in a reasonable time")
    defer { waitForExpectations(timeout: 2) }

    if let url = url {
      URLSession.shared.dataTask(with: url) { data, response, error in
        defer { expectation.fulfill() }

        // now only the error should be nil since data and response should have values
        XCTAssertNil(error)

        do {
          // tests that the response worked
          let response = try XCTUnwrap(response as? HTTPURLResponse)
          XCTAssertEqual(response.statusCode, 200)

          // tests that the json data can be decoded into an array of the model type
          let data = try XCTUnwrap(data)
          XCTAssertNoThrow(
            try JSONDecoder().decode([Item].self, from: data)
          )
        } catch { } // catch can be empty since the Test error will show us the error message

      } // end of URLSession.shared.datatask method
      .resume()
    } // end of url optional binding unwrapping
  } // end of decode test method

  func test_shoppingCartDiscountCodeEntryWorks() {
    let cart = ShoppingCart()
    cart.calculateDiscountPercentage(discountCode: "springbreak")

    XCTAssertEqual(cart.discountPercentage, 0.10)
  }

  func test_shoppingCartDiscountCodeInvalidEntry() {
    let cart = ShoppingCart()
    cart.calculateDiscountPercentage(discountCode: "invalidcode")

    XCTAssertEqual(cart.discountPercentage, 0)
  }

  func test_totalPriceInShoppingCartWhenEmpty() {
    let cart = ShoppingCart()
    let totalPrice = cart.itemsInCart.reduce(0) { $0 + $1.price }
    XCTAssertEqual(totalPrice, 0)
  }

  func test_totalPriceInShoppingCartWithItems() {
    let cart = ShoppingCart()
    cart.itemsInCart.append(
                                Item(id: 1, title: "dummyData", price: 100.00, category: "dummyData",
                                details: "dummyData", image: "dummyData")
                                )
    cart.itemsInCart.append(
                                Item(id: 2, title: "dummyData", price: 50.00, category: "dummyData",
                                details: "dummyData", image: "dummyData")
                                )
    let totalPrice = cart.itemsInCart.reduce(0) { $0 + $1.price }
    XCTAssertEqual(totalPrice, 150.00)
  }

  func test_totalPriceAdjustedForDiscountCode() {
    let cart = ShoppingCart()

    cart.itemsInCart.append(
                                Item(id: 1, title: "dummyData", price: 100.00, category: "dummyData",
                                details: "dummyData", image: "dummyData")
                                )
    cart.itemsInCart.append(
                                Item(id: 2, title: "dummyData", price: 50.00, category: "dummyData",
                                details: "dummyData", image: "dummyData")
                                )
    let totalPrice = cart.itemsInCart.reduce(0) { $0 + $1.price }
    XCTAssertEqual(totalPrice, 150.00)

    cart.calculateDiscountPercentage(discountCode: "newyearnewyou")
    XCTAssertEqual(cart.discountPercentage, 0.50)

    let totalPriceAfterDiscount = totalPrice - (totalPrice * cart.discountPercentage)
    XCTAssertEqual(totalPriceAfterDiscount, 75.0)
  }

} // end of Unit Tests
