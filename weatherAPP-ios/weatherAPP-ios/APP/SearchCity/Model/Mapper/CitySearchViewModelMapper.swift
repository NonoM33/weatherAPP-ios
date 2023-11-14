//
//  File.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation

class CitySearchViewModelMapper {

    func map() -> CitySearchViewModel {
        return CitySearchViewModel(
            searchBarPlaceholder: "Recherchez des villes"
        )
    }
}
