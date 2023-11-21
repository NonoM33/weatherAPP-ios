//
//  DetailTemperatureViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation

struct DetailTemperatureViewModel {
    let temperature: String
    let description: String

    static let empty = Self(
        temperature: "",
        description: ""
    )
}
