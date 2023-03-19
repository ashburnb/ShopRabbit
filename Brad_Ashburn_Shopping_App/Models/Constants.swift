//
//  Constants.swift
//  Brad_Ashburn_Shopping_App
//
//  Created by Brad Ashburn on 3/11/23.
//

import Foundation

enum Constants {
  
  enum Homescreen {
    public static let buttonLineWidth: CGFloat = 2.0
    public static let shadow: CGFloat = 1.0
    public static let buttonPadding: CGFloat = 22.0
    public static let titleTextSize: CGFloat = 50.0
    public static let titleTextTopPadding: CGFloat = 20.0
    public static let bodyBottomPadding: CGFloat = 20.0
    
    public static let categoryButtonWidth: CGFloat = 160.0
    public static let categoryButtonHeight: CGFloat = 100.0
  }
    
  enum Inventory {
    public static let imagePadding: CGFloat = 8.0
    public static let gridColumnMinimumWidth: CGFloat = 150.0
    public static let gridSpacing: CGFloat = 10.0
    public static let gridPadding: CGFloat = 20.0
  }
  
  enum ItemsDisplay {
    public static let imageWidth: CGFloat = 100.0
    public static let imageHeight: CGFloat = 100.0
  }
  
  enum ItemDetails {
    public static let addToCartButtonWidth: CGFloat = 160.0
    public static let addToCartButtonHeight: CGFloat = 50.0
    public static let addToCartButtonCornerRadius: CGFloat = 20.0
    public static let itemAndTextPadding: CGFloat = 15.0
    
    public static let vstackSpacing: CGFloat = 20.0
    public static let vstackPadding: CGFloat = 20.0
    public static let imageWidth: CGFloat = 300.0
    public static let imageHeight: CGFloat = 300.0
  }
  
  enum ShoppingCart {
    public static let attributedStringPadding: CGFloat = 20.0
    public static let discountCodeTextFieldWidth: CGFloat = 200.0
    public static let discountCodeTextFieldHeight: CGFloat = 50.0
    public static let checkoutButtonCornerRadius: CGFloat = 20.0
    public static let listImageThumbnailWidth: CGFloat = 50.0
    public static let listImageThumbnailHeight: CGFloat = 50.0
  }
  
  enum CheckOut {
    public static let applyButtonPadding: CGFloat = 5.0
  }
  
}
