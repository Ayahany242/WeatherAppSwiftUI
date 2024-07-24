//
//  CityCellView.swift
//  MVVM
//
//  Created by AYA on 23/07/2024.
//

import SwiftUI

struct CityCellView: View {
    var city:CityCellData?
    var body: some View {
        HStack {
            Text(city?.cityName ?? "Cairo")
                .font(.system(size: 20))
            Spacer()
            Text("\(city?.weather?.current?.apparentTemperature?.roundDouble() ?? "2")\(city?.weather?.currentUnits?.apparentTemperature ?? "°C")")
                .font(.system(size: 20))
            Spacer()
            Image(systemName: city?.isFav ?? false ? "star.fill" : "star")
                .frame(width: 35, height: 35)
                .foregroundColor(.yellow)
        }.padding(60)
            .frame(height: 40)
    }
}


struct CityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CityCellView()
    }
}
