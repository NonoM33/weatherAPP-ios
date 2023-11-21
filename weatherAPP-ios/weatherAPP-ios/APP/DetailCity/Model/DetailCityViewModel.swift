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
    let backgroundColor: CAGradientLayer
    var imageCity: UIImage?
    let detailLocationViewModel: DetailLocationViewModel
    let detailTemperatureViewModel: DetailTemperatureViewModel

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
        backgroundColor: .init(),
        imageCity: nil,
        detailLocationViewModel: .emtpy,
        detailTemperatureViewModel: .empty
    )
}
