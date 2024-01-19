//
//  CountryModel.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//

import Foundation

struct CountryModel: Identifiable,Codable {
    var id = UUID()
    var name:String
    var cities:[String]
    var countryCode:String
}
