import Foundation

class WeatherViewModel {
    var weatherData: WeatherModel?

    func fetchWeather(for country: CountryModel, completion: @escaping () -> Void) {
        WeatherDataService.shared.fetchWeatherData(for: country) { [weak self] weatherData in
            DispatchQueue.main.async {
                self?.weatherData = weatherData
                completion()
            }
        }
    }
}
