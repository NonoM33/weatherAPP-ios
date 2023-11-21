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
            icon: weatherCityEntitie.icon,
            backgroundColor: weatherCityEntitie.backgroundColor,
            imageCity: nil,
            detailLocationViewModel: mapDetailLocationViewModel(),
            detailTemperatureViewModel: mapDetailTemperatureViewModel(),
            detailStatsInfoViewModel: mapDetailStatsInfoViewModel()
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

    private func mapDetailTemperatureViewModel() -> DetailTemperatureViewModel {
        return DetailTemperatureViewModel(
            temperature: "\(weatherCityEntitie.temperature)°C",
            description: weatherCityEntitie.description
        )
    }

    private func mapDetailStatsInfoViewModel() -> DetailStatsInfoViewModel {
        return DetailStatsInfoViewModel(
            rain: .init(
                value: String(weatherCityEntitie.rainMm),
                description: "Pluie",
                precision: "en mm"
            ),
            wind: .init(
                value: String(weatherCityEntitie.windKmh),
                description: "Vent",
                precision: "en km/h"
            ),
            humidity: .init(
                value: String(weatherCityEntitie.humidityPercent),
                description: "Humidité",
                precision: "en %"
            ),
            UVIndex: .init(
                value: String(weatherCityEntitie.UVIndex),
                description: "Index UV",
                precision: ""
            )
        )
    }
}
