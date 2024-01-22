// CountryCitySelectionViewController.swift
// Role: ViewController in MVVM architecture.
// Responsibilities: Manages the view (CountryCitySelectionView) and interactions with the ViewModel (CountryCitySelectionViewModel).
// It updates the view with data from the ViewModel and handles user actions, such as selections in the tableView.

import UIKit

class CountryCitySelectionViewController: UIViewController {
    // The view that this ViewController manages
    private var countryCitySelectionView = CountryCitySelectionView()

    // ViewModel instance to handle data logic and state
    private var viewModel = CountryCitySelectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the countryCitySelectionView to the ViewController's view
        view.addSubview(countryCitySelectionView)

        // Set this ViewController as dataSource and delegate of the tableView
        countryCitySelectionView.tableView.dataSource = self
        countryCitySelectionView.tableView.delegate = self

        // Setup Auto Layout constraints for the countryCitySelectionView
        setupCountryCitySelectionViewConstraints()

        // Reload tableView data to display countries
        countryCitySelectionView.tableView.reloadData()
    }

    // Function to setup constraints for countryCitySelectionView
    private func setupCountryCitySelectionViewConstraints() {
        countryCitySelectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countryCitySelectionView.topAnchor.constraint(equalTo: view.topAnchor),
            countryCitySelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            countryCitySelectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            countryCitySelectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

// Extension for UITableViewDataSource
extension CountryCitySelectionViewController: UITableViewDataSource {
    // Number of rows in tableView corresponds to number of countries in ViewModel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.countries.count
    }
    
    // Configuring tableView cells with country names from ViewModel
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        cell.textLabel?.text = viewModel.countries[indexPath.row].name
        return cell
    }
}

// Extension for UITableViewDelegate
extension CountryCitySelectionViewController: UITableViewDelegate {
    // Handle user selection of a country in tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = viewModel.countries[indexPath.row]
        
        let weatherViewController = WeatherViewController()
        weatherViewController.selectedLocation = selectedCountry
        
        navigationController?.pushViewController(weatherViewController, animated: true)
    }
}
