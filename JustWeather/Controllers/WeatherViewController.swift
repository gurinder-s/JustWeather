import Foundation
import UIKit

class WeatherViewController: UIViewController {
    var selectedLocation: CountryModel?
    private var weatherView = WeatherView()

    private var viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWeatherView()
        
        if let country = selectedLocation {
            viewModel.fetchWeather(for: country) { [weak self] in
                self?.updateWeatherDisplay()
            }
        }
    }

    private func setupWeatherView() {
        weatherView.backgroundColor = .white // Ensure the background color is set
        weatherView.frame = view.bounds // Set the frame of the weatherView to match the view controller's view
        view.addSubview(weatherView)
    }
    
    private func updateWeatherDisplay() {
        if let weatherData = viewModel.weatherData {
            weatherView.displayWeather(weatherData)
        }
    }
}
