import UIKit

class CountryCitySelectionViewController: UIViewController {
    private var countryCitySelectionView = CountryCitySelectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        CountryDataService.shared.loadCountryData()

        countryCitySelectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countryCitySelectionView)

        NSLayoutConstraint.activate([
            countryCitySelectionView.topAnchor.constraint(equalTo: view.topAnchor),
            countryCitySelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            countryCitySelectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countryCitySelectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])

        countryCitySelectionView.tableView.dataSource = self
        countryCitySelectionView.tableView.delegate = self

        // The closure or delegate for handling country selection should be in CountryCitySelectionView
    }
}

// DataSource
extension CountryCitySelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CountryDataService.shared.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let country = CountryDataService.shared.countries[indexPath.row]
        cell.textLabel?.text = country.name
        return cell
    }
}

// Delegate
extension CountryCitySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = CountryDataService.shared.countries[indexPath.row]
        print("Selected country: \(selectedCountry.name)")
        // Handle country selection
        // Navigation to WeatherViewController or other logic goes here
    }
}
