//
//  AccountView.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 4/12/23.
//

import SwiftUI

struct AccountView: View {
  // For production app, do not use @AppStorage, use Keychain for security purposes
  @AppStorage("firstName") private var firstName = ""
  @AppStorage("lastName") private var lastName = ""
  @AppStorage("address") private var address = ""
  @AppStorage("city") private var city = ""
  @AppStorage("state") private var state = ""
  @AppStorage("zipCode") private var zipCode = ""

  private let states = ["Alabama", "Alaska", "American Samoa", "Arizona", "Arkansas",
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

        Section("Trophies") {
          // place badges in a grid
          // greyed out ones for not earned yet
          HStack {
            Text("Award")
            Text("Award")
            Text("Award")
          }
        }

      }
      .navigationTitle("Account")
    }
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
