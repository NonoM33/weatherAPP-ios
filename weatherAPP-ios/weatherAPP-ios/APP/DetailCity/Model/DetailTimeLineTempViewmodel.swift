//
//  DetailTimeLineTempViewmodel.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation

struct DetailTimeLineTempViewModel {
    let cellModels: [DetailTimeLineTempViewCellModel]

    static let empty = Self(cellModels: [])
}
