//
//  DetailCityViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit

struct DetailCityViewModel {
    let icon: UIImage?
    let backgroundColor: CAGradientLayer
    var imageCity: UIImage?
    let detailLocationViewModel: DetailLocationViewModel
    let detailTemperatureViewModel: DetailTemperatureViewModel
    let detailStatsInfoViewModel: DetailStatsInfoViewModel

    static let empty = Self(
        icon: nil,
        backgroundColor: .init(),
        imageCity: nil,
        detailLocationViewModel: .emtpy,
        detailTemperatureViewModel: .empty,
        detailStatsInfoViewModel: .empty
    )
}
