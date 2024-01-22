
import Foundation

class WeatherViewModel {
    var weatherData: WeatherModel?

    func fetchWeather(for country: CountryModel) {
        WeatherDataService.shared.fetchWeatherData(for: country) { [weak self] weatherData in
            DispatchQueue.main.async {
                self?.weatherData = weatherData
                // Notify the view to update UI
            }
        }
    }
}
