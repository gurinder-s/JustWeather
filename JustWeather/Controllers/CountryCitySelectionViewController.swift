//
//  CountryCitySelectionViewController.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//

import Foundation
import UIKit
class CountryCitySelectionViewController: UIViewController {
    private var countryCitySelectionView: CountryCitySelectionView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        CountryDataService.shared.loadCountryData()
        countryCitySelectionView = CountryCitySelectionView()
        countryCitySelectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countryCitySelectionView)
        NSLayoutConstraint.activate([
                    countryCitySelectionView.topAnchor.constraint(equalTo: view.topAnchor),
                    countryCitySelectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
                    countryCitySelectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    countryCitySelectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
                ])
        countryCitySelectionView.onCountrySelected = { [weak self] country in
                    print("Selected country: \(country.name)")
                    // Handle country selection, for testing just print the name
                }
    }
}
