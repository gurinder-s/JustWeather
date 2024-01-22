//
//  WeatherViewController.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//
// Need to recieve the selected city and fetch weather details for that city
import Foundation
import UIKit
class WeatherViewController: UIViewController {
    var selectedLocation: CountryModel?
    private var weatherView = WeatherView()
    private var viewModel = WeatherViewModel()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.addSubview(weatherView)

            if let country = selectedLocation {
                viewModel.fetchWeather(for: country)
            }
        }
    
    private func updateWeatherDisplay() {
            if let weatherData = viewModel.weatherData {
               
            }
        }
}
