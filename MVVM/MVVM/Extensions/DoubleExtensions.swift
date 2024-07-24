//
//  DoubleExtensions.swift
//  MVVM
//
//  Created by AYA on 23/07/2024.
//

import Foundation

extension Double{
    func roundDouble() -> String{
        return String(format: "%0.f", self)
    }
}
