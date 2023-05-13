//
//  UserDefaultsUtils.swift
//  learnSwiftUI
//
//  Created by djorge on 13/5/23.
//

import Foundation

class UserDefaultsUtils {
  static var shared = UserDefaultsUtils()
  
  func setDarkMode(enable: Bool) {
    let defaults = UserDefaults.standard
    defaults.set(enable, forKey: Constants.DarkMode)
  }
  
  func getDarkMode() -> Bool {
    let defaults = UserDefaults.standard
    return defaults.bool(forKey: Constants.DarkMode)
  }
}
