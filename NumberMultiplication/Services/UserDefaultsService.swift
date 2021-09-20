//
//  UserDefaultsService.swift
//  NumberMultiplication
//
//  Created by Ivan Stajcer on 20.09.2021..
//

import Foundation

final class UserDefaultsService {
  
  static func saveToDefaults(settings: Settings) {
    guard let encodedSettings = try? JSONEncoder().encode(settings) else {return}
    let userDefaults = UserDefaults()
    userDefaults.setValue(encodedSettings, forKey: "settings")
    
  }
  
  static func readFromDefaults() -> Settings? {
    let userDefaults = UserDefaults()
    guard let encodedData =  userDefaults.data(forKey: "settings") else {return nil}
    return try? JSONDecoder().decode(Settings.self, from: encodedData)
  }
  
}
