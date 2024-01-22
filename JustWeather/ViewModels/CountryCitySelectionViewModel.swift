// CountryCitySelectionViewModel.swift
// Role: ViewModel in MVVM architecture.
// Responsibilities: Manages the business logic and data for the CountryCitySelectionView. It retrieves and holds country data, which the view uses to present information to the user.

import Foundation

class CountryCitySelectionViewModel {
    // Array to hold country data
    var countries: [CountryModel] = []

    init() {
        // Loading country data from the CountryDataService when the ViewModel is initialized
        CountryDataService.shared.loadCountryData()
        countries = CountryDataService.shared.countries

        // Debug print statement to verify the number of countries loaded
        print("Countries loaded in ViewModel: \(countries.count)")
    }
}
