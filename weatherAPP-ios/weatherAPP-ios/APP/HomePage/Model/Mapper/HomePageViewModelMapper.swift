//
//  HomePageViewModelMapper.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation

final class HomePageViewModelMapper {

    func map() -> HomePageViewModel {
        return HomePageViewModel(
            cityFavoriteViewModel: mapCityFavoriteViewModel()
        )
    }

    // MARK: - Private

    private func mapCityFavoriteViewModel() -> CityFavoriteViewModel {
        return CityFavoriteViewModel(cityFavoriteViewCellsModels: mapCityFavoriteViewCellsModels())
    }

    private func mapCityFavoriteViewCellsModels() -> [CityFavoriteViewCellModel] {
        return [.init(
            cityName: "Antony",
            icon: ._01D,
            temperature: "12°C",
            lon: 2.2945486000000002,
            lat: 48.752281000000004
        )]
    }

    private func mapCityFavoriteViewCellModel() -> CityFavoriteViewCellModel {
        return CityFavoriteViewCellModel(cityName: "", icon: ._01D, temperature: "12°C", lon: 30, lat: 30)
    }
}
