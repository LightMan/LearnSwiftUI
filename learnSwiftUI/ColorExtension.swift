//
//  ColorExtension.swift
//  learnSwiftUI
//
//  Created by djorge on 8/5/23.
//

import SwiftUI

enum ThemeMode {
  case dark
  case light
}

struct Theme {
  
  private var mode = ThemeMode.light

  static let smoke = Color(white: 0.9)
  static let red = Color.red

  static var primaryColor: Color {
    get { smoke }
  }
  
  static var secondatyColor: Color {
    get { red }
  }

}
