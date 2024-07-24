//
//  ViewModel.swift
//  MVVM
//
//  Created by AYA on 24/07/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var isLoading = true
    
    private let cities:[City] = [City(cityName: "Cairo", lat: 30.06263, long: 31.24967),City(cityName: "Tokyo", lat: 35.6895, long: 139.69171),City(cityName: "Madrid", lat: 40.4165, long: -3.70256),City(cityName: "Lagos", lat: 6.45407, long: 3.39467),City(cityName: "Moscow", lat: 55.75222, long: 37.61556)]
    @Published var citiesData: CitiesWeatherModel = []
    @Published var citiesDataCell: [CityCellData] = []
    
    func fetchCitiesWeather() {
        isLoading = true
        NetworkService.shared.fetchWeatherData(cities: cities, completion: { [weak self] result in
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self?.citiesData = weather
                    self?.updateCityData()
                    self?.isLoading = false
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        })
    }
    private func updateCityData() {
        for city in cities {
            if let weather = citiesData.first(where: { Int($0.latitude ?? 0) == Int(city.lat ?? 0) && Int($0.longitude ?? 0) == Int(city.long ?? 0) }) {
                citiesDataCell.append(CityCellData(cityName: city.cityName, weather: weather , isFav: false))
                print("City name \(city.cityName) , temp = \(weather.current?.apparentTemperature)")
            }
        }
    }
                                               
}
