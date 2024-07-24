//
//  ContentView.swift
//  MVVM
//
//  Created by AYA on 23/07/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isSplash = true
    var body: some View {
        if isSplash{
            VStack {
                Image("eva_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.padding()
            .onAppear{
                withAnimation {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                        isSplash = false
                    }
                }
            }
        }else{
            CitiesScreen()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
