//
//  DetailCityViewModelMapper.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation

class DetailCityViewModelMapper {

    private let weatherCityEntitie: WeatherCityEntitie

    init(weatherCityEntitie: WeatherCityEntitie) {
        self.weatherCityEntitie = weatherCityEntitie
    }

    // MARK: - DetailCityViewModelMapper

    func map() -> DetailCityViewModel {
        return DetailCityViewModel(
            cityName: weatherCityEntitie.cityName,
            date: weatherCityEntitie.date,
            temperature: weatherCityEntitie.temperature,
            description: weatherCityEntitie.description,
            rainMm: weatherCityEntitie.rainMm,
            windKmh: weatherCityEntitie.windKmh,
            humidityPercent: weatherCityEntitie.humidityPercent,
            UVIndex: weatherCityEntitie.UVIndex,
            icon: weatherCityEntitie.icon,
            backgroundColor: weatherCityEntitie.backgroundColor,
            imageCity: nil,
            detailLocationViewModel: mapDetailLocationViewModel()
        )
    }

    // MARK: - Private

    private func mapDetailLocationViewModel() -> DetailLocationViewModel {
        return DetailLocationViewModel(
            location: weatherCityEntitie.cityName,
            date: weatherCityEntitie.date,
            isToday: weatherCityEntitie.date == Date().formatted(date: .abbreviated, time: .shortened)
        )
    }
}
