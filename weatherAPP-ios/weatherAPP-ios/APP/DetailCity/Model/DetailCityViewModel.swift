//
//  DetailCityViewModel.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit

struct DetailCityViewModel {
    let backgroundColor: CAGradientLayer
    let detailLocationViewModel: DetailLocationViewModel
    let detailTemperatureViewModel: DetailTemperatureViewModel
    let detailStatsInfoViewModel: DetailStatsInfoViewModel
    let detailTimeLineTempViewmodel: DetailTimeLineTempViewModel
    let detailFuturTempDailyViewModel: DetailFuturTempDailyViewModel

    static let empty = Self(
        backgroundColor: .init(),
        detailLocationViewModel: .emtpy,
        detailTemperatureViewModel: .empty,
        detailStatsInfoViewModel: .empty,
        detailTimeLineTempViewmodel: .empty,
        detailFuturTempDailyViewModel: .empty
    )
}
