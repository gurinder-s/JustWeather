import Foundation

class WeatherDataService {
    static let shared = WeatherDataService()

    func fetchWeatherData(for country: CountryModel, completion: @escaping (WeatherModel?) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=b16edaf1de6d411cac6220454242201&q=\(country.name)&aqi=no"
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let currentWeather = weatherResponse.current
                completion(currentWeather)
            } catch {
                print("Failed to decode weather data: \(error)")
                completion(nil)
            }
        }

        task.resume()
    }
}
