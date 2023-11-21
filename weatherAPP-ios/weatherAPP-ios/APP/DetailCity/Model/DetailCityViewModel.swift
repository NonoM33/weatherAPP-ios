//
//  DetailCityViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit

struct DetailCityViewModel {
    let cityName: String
    let date: String
    let temperature: String
    let description: String
    let rainMm: String
    let windKmh: String
    let humidityPercent: String
    let UVIndex: String
    let icon: UIImage?
    let backgroundColor: UIColor
    var imageCity: UIImage?

    static let empty = Self(
        cityName: "",
        date: "",
        temperature: "",
        description: "",
        rainMm: "",
        windKmh: "",
        humidityPercent: "",
        UVIndex: "",
        icon: nil,
        backgroundColor: .white,
        imageCity: nil
    )
}
