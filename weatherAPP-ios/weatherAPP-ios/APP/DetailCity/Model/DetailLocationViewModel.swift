//
//  DetailLocationViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation

struct DetailLocationViewModel {
    let location: String
    let date: String
    let isToday: Bool

    static let emtpy = Self(
        location: "",
        date: "",
        isToday: false
    )
}
