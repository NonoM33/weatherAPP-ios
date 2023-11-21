//
//  WeatherCityEntitie.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit

struct WeatherCityEntitie {
    let cityName: String
    let date: String
    let temperature: String
    let description: String
    let rainMm: Int
    let windKmh: String
    let humidityPercent: Int
    let UVIndex: Int
    let icon: UIImage?
    let backgroundColor: CAGradientLayer
}
