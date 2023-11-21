//
//  Double.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation

extension Double {
    func formatted(withDecimalPlaces places: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = places
        formatter.minimumFractionDigits = places
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
