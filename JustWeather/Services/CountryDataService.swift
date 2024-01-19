//
//  CountryDataService.swift
//  JustWeather
//
//  Created by G on 19/01/2024.
//

import Foundation
class CountryDataService {
    static let shared = CountryDataService()
    private(set) var countries: [CountryModel] = []
    
    private init(){}
    
    func loadCountryData(){
        //Find the countries .json
        guard let url = Bundle.main.url(forResource: "countries", withExtension: ".json") else{
            fatalError("Cant find countries.json")
        }
        
        //load the countries.json
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load countries.json")
        }
        
        //decode the json file
        let decoder = JSONDecoder()
        guard let loadedCountries = try? decoder.decode([CountryModel].self, from: data) else {
            fatalError("Failed to decode countries.json")
        }
        self.countries = loadedCountries
    }
}
