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
    let detailLocationViewModel: DetailLocationViewModel
    let detailTemperatureViewModel: DetailTemperatureViewModel
    let detailStatsInfoViewModel: DetailStatsInfoViewModel
    let detailTimeLineTempViewmodel: DetailTimeLineTempViewModel
    let detailFuturTempDailyViewModel: DetailFuturTempDailyViewModel

    static let empty = Self(
        icon: nil,
        backgroundColor: .init(),
        detailLocationViewModel: .emtpy,
        detailTemperatureViewModel: .empty,
        detailStatsInfoViewModel: .empty,
        detailTimeLineTempViewmodel: .empty,
        detailFuturTempDailyViewModel: .empty
    )
}
