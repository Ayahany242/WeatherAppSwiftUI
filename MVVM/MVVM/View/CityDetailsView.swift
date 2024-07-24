//
//  CityDetailsView.swift
//  MVVM
//
//  Created by AYA on 23/07/2024.
//

import SwiftUI

struct CityDetailsView: View {
    var city:CityCellData?
    var delegate:FavoriteCityDelegation?
//    @State var isFav:Bool? = false
//    var index:Int?
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack{
                HStack{
                    Spacer()
                    Button {
                        //isFav = !isFav!
                        delegate?.isFavorite(city: city!)
                    } label: {
                        Image(systemName: city?.isFav ?? false ? "star.fill" : "star")
                            .font(.system(size: 24))
                            .foregroundColor(city?.isFav ?? false ? .yellow : .black)
                    }.padding(8)
                }.padding(.trailing,24)
            Spacer()
            Text(city?.cityName ?? "Cairo")
                .font(.largeTitle)
                .bold()
            Text("\(city?.weather?.current?.apparentTemperature?.roundDouble() ?? "2")\(city?.weather?.currentUnits?.apparentTemperature ?? "°C")")
                .font(.system(size: 32))
                .bold()
                .padding(8)
            VStack{
                HStack{
                    Text("Humidity:")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.trailing,16)
                    Text("\(city?.weather?.current?.relativeHumidity2M ?? 2)\(city?.weather?.currentUnits?.relativeHumidity2M ?? "m")")
                        .font(.system(size: 26))
                }.padding(8)
                HStack{
                    Text("Weather State:")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.trailing,16)
                    Text("\(city?.weather?.current?.rain?.roundDouble() ?? "0")\(city?.weather?.currentUnits?.rain ?? "mm")")
                        .font(.system(size: 26))
                }.padding(8)
                HStack{
                    Text("Visibility:")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.trailing,16)
                    Text("\(city?.weather?.current?.visibility?.roundDouble() ?? "0")\(city?.weather?.currentUnits?.visibility ?? "m")")
                        .font(.system(size: 26))
                }.padding(8)
                HStack{
                    Text("Wind:")
                        .font(.system(size: 28))
                        .bold()
                        .padding(.trailing,16)
                    Text("\(city?.weather?.current?.windSpeed?.roundDouble()  ?? "0")\(city?.weather?.currentUnits?.windSpeedM ?? "km/h")")
                        .font(.system(size: 26))
                }.padding(8)
            }.padding(16)
            Spacer()
            
            
        }
    }
        
    }
}

struct CityDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailsView()
    }
}
