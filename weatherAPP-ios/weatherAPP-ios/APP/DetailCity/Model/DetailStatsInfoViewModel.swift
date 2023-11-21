//
//  DetailStatsInfoViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation

struct DetailStatsInfoViewModel {
    let rain: DetailStatsInfoViewCellModel
    let wind: DetailStatsInfoViewCellModel
    let humidity: DetailStatsInfoViewCellModel
    let UVIndex: DetailStatsInfoViewCellModel

    static let empty = Self(
        rain: .init(value: "", description: "", precision: ""),
        wind: .init(value: "", description: "", precision: ""),
        humidity: .init(value: "", description: "", precision: ""),
        UVIndex: .init(value: "", description: "", precision: "")
    )
}
