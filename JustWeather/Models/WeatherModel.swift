struct WeatherResponse: Codable {
    let location: Location
    let current: WeatherModel
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tz_id: String
    let localtime: String
}

struct WeatherModel: Codable {
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMPH: Double
    let windKPH: Double
    let windDegree: Int
    let windDir: String
    let humidity: Int
    let feelslikeC: Double
    let feelslikeF: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMPH = "wind_mph"
        case windKPH = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case humidity
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
    }
}

struct Condition: Codable {
    let text: String
    let icon: String
    let code: Int
}
