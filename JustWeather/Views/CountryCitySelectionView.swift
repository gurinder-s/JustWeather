//
//  CountryCitySelectionView.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//

import Foundation
import UIKit
class CountryCitySelectionView: UIView{
    
    var onCountrySelected: ((CountryModel) -> Void)?
    // UI Components
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false // Using Autolayout which is common
        return table
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupTableView()
    }
    
    required init(coder: NSCoder) {
        fatalError("not been implemented")
    }
    
    private func setupTableView(){
        addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        // adding table to the view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        //setting up constraints for the table
        NSLayoutConstraint.activate([
                        tableView.topAnchor.constraint(equalTo: self.topAnchor),
                        tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
                        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                        tableView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }
}

extension CountryCitySelectionView: UITableViewDataSource{
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

extension CountryCitySelectionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle the selection of a country
        let selectedCountry = CountryDataService.shared.countries[indexPath.row]
        onCountrySelected?(selectedCountry)
        // Maybe notify a delegate or use a closure to communicate the selection
    }
}
