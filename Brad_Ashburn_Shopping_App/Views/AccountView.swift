//
//  AccountView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/12/23.
//

import SwiftUI

struct AccountView: View {
  @EnvironmentObject var orders: OrdersViewModel
  @EnvironmentObject var cart: ShoppingCartViewModel
  // For production app, do not use @AppStorage, use Keychain for security purposes
  @AppStorage("firstName") var firstName = ""
  @AppStorage("lastName") var lastName = ""
  @AppStorage("address") var address = ""
  @AppStorage("city") var city = ""
  @AppStorage("state") var state = ""
  @AppStorage("zipCode") var zipCode = ""
  @State private var showRedemptionSheet = false
  let states = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas",
                        "California", "Colorado", "Connecticut", "Delaware",
                        "District of Columbia", "Florida", "Georgia", "Guam", "Hawaii", "Idaho",
                        "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine",
                        "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi",
                        "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
                        "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota",
                        "Northern Mariana Islands", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
                        "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
                        "U.S. Virgin Islands", "Utah", "Vermont", "Virginia", "Washington",
                        "West Virginia", "Wisconsin", "Wyoming"]
  @State private var showDiscountCode10 = false
  @State private var showDiscountCode20 = false
  @State private var showDiscountCode30 = false
  @State private var showNotEnoughPoints = false
  @State private var newCode10 = ""
  @State private var newCode20 = ""
  @State private var newCode30 = ""

  var body: some View {
    NavigationView {
      Form {
        Section("Profile") {
          HStack {
            Spacer()
            Image("profilephoto")
              .resizable()
              .scaledToFit()
              .frame(width: 200)
              .clipShape(Circle())
            Spacer()
          }
          TextField("First Name", text: $firstName)
          TextField("Last Name", text: $lastName)
          TextField("Address", text: $address)
          TextField("City", text: $city)
          Picker("State", selection: $state) {
            ForEach(states, id: \.self) {
              Text($0)
            }
          }
          TextField("Zipcode", text: $zipCode)
        }

        Section("Orders") {
          NavigationLink {
            OrdersView()
          } label: {
            Text("Orders Placed")
          }
        }

        Section("Carrot Points") {
          HStack {
            Spacer()
            Text("\(orders.carrotPoints)")
              .font(.system(size: 40, design: .rounded))
              .bold()
            Image("carrotpoints")
              .resizable()
              .scaledToFit()
              .frame(width: 100)
            Spacer()
          }
          Button {
            showRedemptionSheet.toggle()
          } label: {
            HStack {
              Spacer()
              Text("Redeem for Rewards")
              Spacer()
            }
          }

        }

      }
      .navigationTitle("Account")
      .sheet(isPresented: $showRedemptionSheet) {
        VStack {
          Text("Discounts Available")
            .font(.largeTitle)
            .bold()
            .padding(.top, 30)

          Text("Carrot points available to redeem")
          HStack {
            Spacer()
            Text("\(orders.carrotPoints)")
              .font(.system(size: 60, design: .rounded))
              .bold()
            Image("carrotpoints")
              .resizable()
              .scaledToFit()
              .frame(width: 100)
            Spacer()
          }

          Text("Tap on a coupon below activate your discount")

          HStack {
            Button {
              showDiscountCode20 = false
              showDiscountCode30 = false
              showNotEnoughPoints = false
              if orders.carrotPoints >= 1000 {
                orders.carrotPoints -= 1000
                showDiscountCode10.toggle()
                newCode10 = cart.createDiscountCode()
                cart.saveDiscountCode(newCode10, percentOff: 0.10)
              } else {
                showNotEnoughPoints.toggle()
              }
            } label: {
              RedemptionTile(discount: 10, pointsRequired: 1000)
            }

            Button {
              showDiscountCode10 = false
              showDiscountCode30 = false
              showNotEnoughPoints = false
              if orders.carrotPoints >= 1750 {
                orders.carrotPoints -= 750
                showDiscountCode20.toggle()
                newCode20 = cart.createDiscountCode()
                cart.saveDiscountCode(newCode20, percentOff: 0.20)
              } else {
                showNotEnoughPoints.toggle()
              }
            } label: {
              RedemptionTile(discount: 20, pointsRequired: 1750)
            }
            Button {
              showDiscountCode10 = false
              showDiscountCode20 = false
              showNotEnoughPoints = false
              if orders.carrotPoints >= 2000 {
                orders.carrotPoints -= 2000
                showDiscountCode30.toggle()
                newCode30 = cart.createDiscountCode()
                cart.saveDiscountCode(newCode30, percentOff: 0.30)
              } else {
                showNotEnoughPoints.toggle()
              }
            } label: {
              RedemptionTile(discount: 30, pointsRequired: 2000)
            }
          }

          if showDiscountCode10 {
            VStack {
              Text("Here is your 10% off discount code: ")
              Text("\(newCode10)")
                .font(.largeTitle)
                .bold()
            }
            .padding(30)
          }
          if showDiscountCode20 {
            VStack {
              Text("Here is your 20% off discount code: ")
              Text("\(newCode20)")
                .font(.largeTitle)
                .bold()
            }
            .padding(30)
          }
          if showDiscountCode30 {
            VStack {
              Text("Here is your 30% off discount code: ")
              Text("\(newCode30)")
                .font(.largeTitle)
                .bold()
            }
            .padding(30)
          }
          if showNotEnoughPoints {
            Text("Sorry, not enough carrot points")
              .padding(30)
          }
          Spacer()
        }
      }
    }
  }
}

struct RedemptionTile: View {
  let discount: Int
  let pointsRequired: Int

  var body: some View {
    VStack {
      VStack {
        Image("carrotpoints")
          .resizable()
          .scaledToFit()
          .frame(width: 80)
        Text("\(discount)%")
          .font(.largeTitle)
          .bold()
          .foregroundColor(.black)
        Text("off code")
          .font(.caption)
          .foregroundColor(.black)
      }
      .padding()
      .border(
        .black, width: 8
      )
      .cornerRadius(10)
      Text("\(pointsRequired) pts")
        .foregroundColor(Color("HomescreenColor"))
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
      .environmentObject(OrdersViewModel())
      .environmentObject(ShoppingCartViewModel())
  }
}
