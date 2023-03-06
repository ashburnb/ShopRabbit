import UIKit

let itemPrices: [Double] = [1.99, 4.75, 8.50, 10, 20, 249, 1199, 2499]

var totalAmount: Double = itemPrices.reduce(0,+)

let discountTypes = [
  "tenOff": 0.10,
  "twentyFiveOff": 0.25,
  "halfOff": 0.50
]

enum DiscountType {
  case tenOff
  case twentyFiveOff
  case halfOff
}

let discountType = discountTypes["tenOff"]

let discountPercentage: Double = 0.10

var discountedAmount: Double {
  return totalAmount * discountPercentage
}

var totalAmountAfterDiscount: Double {
  return totalAmount - discountedAmount
}


// Assignment 1 - Function
func calculateDiscount(totalAmount: Double, discountPercentage: Double) -> Double {
  let discountedAmount = totalAmount * discountPercentage
  let totalAmountAfterDiscount = totalAmount - discountedAmount
  return totalAmountAfterDiscount
}


let totalAmountAfterDiscountExample1 = calculateDiscount(totalAmount: 100.00, discountPercentage: 0.10)
print("Assignment 1 - Function")
print("Total amount of $100.00, with a 10% discount = $\(String(format: "%.2f", totalAmountAfterDiscountExample1))")
print("")

// Assignment 2 - Function
func calculateDiscount(totalAmount: Double, discountPercentageDefaultToTen: Double = 0.10) -> Double {
  let discountedAmount = totalAmount * discountPercentage
  let totalAmountAfterDiscount = totalAmount - discountedAmount
  return totalAmountAfterDiscount
}

let totalAmountAfterDiscountExample2 = calculateDiscount(totalAmount: 200)
print("Assignment 2 - Function")
print("Total amount of $200.00, with a default 10% discount = $\(String(format: "%.2f", totalAmountAfterDiscountExample2))")
print("")


// Assignment 3
typealias DiscountedAmount = (Double, String) -> Double
var printDiscount: DiscountedAmount = { (totalAmount: Double, withDiscountOff: String) in
  let totalDiscount = totalAmount - ( totalAmount * (discountTypes[withDiscountOff] ?? 1) )
  print(totalDiscount)
  return totalDiscount
}

print("Assignment 3 - Typealias")
print("Total amount of $500, with a half off discount = ")
printDiscount(500.0, "halfOff")
print("")


// Assignment 4 - Closure
var totalAmountAfterDiscountExample4 = { (totalAmount: Double, discountType: String) in
  let totalAmount = totalAmount - ( totalAmount * (discountTypes[discountType] ?? 1) )
  print("Total amount after a discount of \((discountTypes[discountType] ?? 1)*100)% is $\(totalAmount).")
}

print("Assignment 4 - Closure")
totalAmountAfterDiscountExample4(1000, "tenOff")
print("")


// Assignment 5
let inflatedItemPrices = itemPrices.map { $0 + ($0 * 0.50) }
print("Assignment 5 - Map")
print("All item prices increased by 50% and stored in a new array")
print(inflatedItemPrices)
print("")


// Assignment 6 - Sorted
let sortedDiscountDictionary = discountTypes.sorted { $0.value > $1.value
}
print("Assignment 6 - Sorted")
print("A sorted discount dictionary by decreasing discount values")
print(sortedDiscountDictionary)
print("")


// Assignment 7 - Enums and Switch Cases
func printDiscount(for discountType: DiscountType) -> Double {
  var discountAmount: Double
  switch discountType {
    case DiscountType.tenOff:
      discountAmount = 0.10
    case DiscountType.twentyFiveOff:
      discountAmount = 0.25
    case DiscountType.halfOff:
      discountAmount = 0.50
  }
  print("The discount value is \(discountAmount*100)% off your total amount.")
  return discountAmount
}

print("Assignment 7 - Enums and Switch Cases")
print("An overloaded printDiscount function was created whose function body uses a switch case and the parameter is from an enum")
printDiscount(for: DiscountType.halfOff)
print("")


// Assignment 8 - Computed Property
var currentDiscountedAmount: Double {
  return totalAmount - discountedAmount
}

print("Assignment 8 - Computed Property")
print("Total Amount: $\(totalAmount) with \(discountPercentage*100)% off ($\(String(format: "%.2f", discountedAmount))) = $\(String(format: "%.2f", currentDiscountedAmount))")
print("")


// Assignment 9 - Lazy Property
struct Purchase {
  lazy var maximumDiscount: Double = 0.50
}

var blackFridaySale = Purchase()
print("Assignment 9 - Lazy Property")
print("An example of a lazy property from the Purchase struct: \(blackFridaySale.maximumDiscount)")
print("")


// Assignment 10 - Method
struct ShoppingCart {
  let totalAmount: Double
  let discountPercentage: Double
  
  func totalAmountAfterApplyingDiscount() -> String {
    let totalAfterDiscount = totalAmount - (totalAmount * discountPercentage)
    return "$\(String(format: "%.2f", totalAfterDiscount))"
  }
}

let shopRabbitCart = ShoppingCart(totalAmount: 1000, discountPercentage: 0.50)
print("Assignment 10 - Method")
print("A struct method is used to calculate the total amount after applying a 50% off discount")
print("Total amount after discount = \(shopRabbitCart.totalAmountAfterApplyingDiscount())")
print("")


// Assignment 11 - Protocol
protocol Discount {
  var discountName: String { get }
  var discountPercentage: Double { get }
  var totalAmount: Double { get }
  
  func calculateDiscount() -> Double
}

class BlackFridaySale: Discount {
  let discountName: String
  let discountPercentage: Double
  var totalAmount: Double
  
  init(discountName: String, discountPercentage: Double, totalAmount: Double) {
    self.discountName = discountName
    self.discountPercentage = discountPercentage
    self.totalAmount = totalAmount
  }
  
  func calculateDiscount() -> Double {
    return totalAmount - (totalAmount * discountPercentage)
  }
}

let blackFriday2023 = BlackFridaySale(discountName: "tenOff", discountPercentage: 0.10, totalAmount: 60.00)
print("Assignment 11 - Protocol")
print("A BlackFridaySale class which conforms to a Discount protocol was created")
print("10% off of $60.00 is $\(String(format: "%.2f", blackFriday2023.calculateDiscount()))")
print("")


// Assignment 12 - Extension
extension BlackFridaySale {
  func roundedToClosestInt() -> Int {
    return Int(self.calculateDiscount().rounded())
  }
}

print("Assignment 12 - Extension")
print("A class extension to BlackFridaySale includes a method to return the total amount rounded to the nearest integer.")
print("A 10% off discount off $60.00 is $\(blackFriday2023.roundedToClosestInt())")


