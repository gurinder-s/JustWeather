

import UIKit

class WeatherView: UIView {
    // UI Elements
    let temperatureLabel = UILabel()
    let conditionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Temperature Label
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textAlignment = .center
        addSubview(temperatureLabel)

        // Condition Label
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        conditionLabel.textAlignment = .center
        addSubview(conditionLabel)

        // Constraints
        NSLayoutConstraint.activate([
            temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            conditionLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            conditionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func displayWeather(_ weather: WeatherModel) {
        temperatureLabel.text = "Temp: \(weather.tempC)°C / \(weather.tempF)°F"
        conditionLabel.text = weather.condition.text
    }
}
