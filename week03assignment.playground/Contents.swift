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
  if totalAmount < 0 {
    print("Error. Total amount cannot be less than zero.")
  }
  if discountPercentage <= 0 {
    print("Error. Discount Percentage must be more than zero.")
  }
  
  let discountedAmount = totalAmount * discountPercentage
  let totalAmountAfterDiscount = totalAmount - discountedAmount
  return totalAmountAfterDiscount
}

let totalAmountAfterDiscountExample1 = calculateDiscount(totalAmount: 100, discountPercentage: 0.10)
print(totalAmountAfterDiscountExample1)


// Assignment 2 - Function
func calculateDiscount(totalAmount: Double, discountPercentageDefaultToTen: Double = 0.10) -> Double {
  if totalAmount < 0 {
    print("Error. Total amount cannot be less than zero.")
  }
  if discountPercentage <= 0 {
    print("Error. Discount Percentage must be more than zero.")
  }
  
  let discountedAmount = totalAmount * discountPercentage
  let totalAmountAfterDiscount = totalAmount - discountedAmount
  return totalAmountAfterDiscount
}

let totalAmountAfterDiscountExample2 = calculateDiscount(totalAmount: 200)
print(totalAmountAfterDiscountExample2)


// Assignment 3
typealias DiscountedAmount = (Double, String) -> Double
var printDiscount: DiscountedAmount = { (totalAmount: Double, withDiscountOff: String) in
  return totalAmount - ( totalAmount * (discountTypes[withDiscountOff] ?? 1) )
}


// Assignment 4 - Closure
var totalAmountAfterDiscountExample4 = { (totalAmount: Double, discountType: String) in
  let totalAmount = totalAmount - ( totalAmount * (discountTypes[discountType] ?? 1) )
  print("Total amount after a discount of \((discountTypes[discountType] ?? 1)*100)% is $\(totalAmount).")
}
totalAmountAfterDiscountExample4(100, "tenOff")


// Assignment 5
let inflatedItemPrices = itemPrices.map { $0 + ($0 * (discountTypes["halfOff"] ?? 1)) }
print(inflatedItemPrices)


// Assignment 6 - Sorted
let sortedDiscountDictionary = discountTypes.sorted { $0.value > $1.value
}
print(sortedDiscountDictionary)


// Assignment 7 - Enums and Switch Cases
func printDiscount(for discountType: DiscountType) -> Double {
  var discountAmount: Double
  switch discountType {
    case DiscountType.tenOff:
      discountAmount = 0.10
    case DiscountType.twentyFiveOff:
      discountAmount = 0.10
    case DiscountType.halfOff:
      discountAmount = 0.10
  }
  print("The discount value is \(discountAmount*100)% off your total amount.")
  return discountAmount
}

printDiscount(for: DiscountType.halfOff)


// Assignment 8 - Computed Property
var currentDiscountedAmount: Double {
  return totalAmount - discountedAmount
}

print("Total Amount: $\(totalAmount) with \(discountPercentage*100)% off ($\(String(format: "%.2f", discountedAmount))) = $\(String(format: "%.2f", currentDiscountedAmount))")


// Assignment 9 - Lazy Property
struct Purchase {
  lazy var maximumDiscount: Double = 0.50
}

var blackFridaySale = Purchase()
print(blackFridaySale.maximumDiscount)


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
print(shopRabbitCart.totalAmountAfterApplyingDiscount())


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

let blackFriday2023 = BlackFridaySale(discountName: "tenOff", discountPercentage: 0.15, totalAmount: 60.59)
print(blackFriday2023.calculateDiscount())


// Assignment 12 - Extension
extension BlackFridaySale {
  func roundedToClosestInt() -> Double {
    return self.calculateDiscount().rounded()
  }
}

print(blackFriday2023.roundedToClosestInt())


