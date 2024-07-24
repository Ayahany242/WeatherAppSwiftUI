//
//  CitiesScreen.swift
//  MVVM
//
//  Created by AYA on 23/07/2024.
//

import SwiftUI

struct CitiesScreen: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(1.5)
                    }else{
                        VStack {
                            List(viewModel.citiesDataCell, id: \.cityName) { city in
                                NavigationLink(destination: CityDetailsView(city: city,delegate: self)) {
                                    CityCellView(city: city)
                                }
                            }.frame(height: 350)
                                .listRowBackground(Color.clear)
                                .navigationBarHidden(true)
                        }.scrollContentBackground(.hidden)
                        
                    }
                }.navigationTitle("Cities")
                    .onAppear {
                        viewModel.fetchCitiesWeather()
                    }
            }
        }
    }
}
extension CitiesScreen: FavoriteCityDelegation {
    func isFavorite(city: CityCellData) {
        if let index = viewModel.citiesDataCell.firstIndex(where: { $0.cityName == city.cityName }) {
            viewModel.citiesDataCell[index].isFav?.toggle()
            print("Favvvvv")
        }
    }
}

struct CitiesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CitiesScreen()
    }
}
