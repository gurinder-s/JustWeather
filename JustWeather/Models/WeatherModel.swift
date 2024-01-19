//
//  WeatherModel.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//
import Foundation

struct WeatherModel : Identifiable, Codable{
    var id = UUID()
    var country: CountryModel
    var tempC: Double
    var tempF: Double
    var feelsLikeC: Double
    var feelsLikeF: Double
    var conditionText: String
    var conditionIconURL: String
    var windMPH: Double
    var windKPH: Double
    var windDirectionDegrees: Int
    var humidity: Int
    var cloudCover: Int
    var isDay:Int
}
