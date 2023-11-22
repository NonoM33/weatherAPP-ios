//
//  DetailCityViewModelMapper.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherPackage
import UIKit

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
            detailLocationViewModel: mapDetailLocationViewModel(),
            detailTemperatureViewModel: mapDetailTemperatureViewModel(),
            detailStatsInfoViewModel: mapDetailStatsInfoViewModel(),
            detailTimeLineTempViewmodel: mapDetailTimeLineTempViewmodel(),
            detailFuturTempDailyViewModel: mapDetailFuturTempDailyViewModel()
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

    private func mapDetailTimeLineTempViewmodel() -> DetailTimeLineTempViewModel {
        return DetailTimeLineTempViewModel(
            cellModels: mapDetailTimeLineTempViewCellsModels())
        }

    private func mapDetailTimeLineTempViewCellsModels() -> [DetailTimeLineTempViewCellModel] {
        return weatherCityEntitie.hourlyTemp.map({
            mapDetailTimeLineTempViewCellModel(
                hourly: $0
            )
        })
    }

    private func mapDetailTimeLineTempViewCellModel(hourly: HourlyWeather) -> DetailTimeLineTempViewCellModel {
        return DetailTimeLineTempViewCellModel(
            value: String("\(Int(WeatherTools.convertKelvinToCelsius(kelvin: hourly.temp)))°"),
            icon: UIImage(named: hourly.weather[0].icon) ?? ._01D,
            time: "\(WeatherTools.convertUnixTimeToDate(unixTime: hourly.dt, dateFormat: "HH"))H",
            isNow: mapIsNow(hourly: hourly)
        )
    }

    private func mapIsNow(hourly: HourlyWeather) -> Bool {
        let hourWeather = WeatherTools.convertUnixTimeToDate(unixTime: hourly.dt, dateFormat: "dd/MM/YY HH")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YY HH"
        let hourNow = dateFormatter.string(from: Date())
        return hourNow == hourWeather
    }

    private func mapDetailFuturTempDailyViewModel() -> DetailFuturTempDailyViewModel {
        return DetailFuturTempDailyViewModel(
            detailFuturTempDailyViewCellsModels: mapDetailFuturTempDailyViewCellsModels()
        )
    }

    private func mapDetailFuturTempDailyViewCellsModels() -> [DetailFuturTempDailyViewCellModel] {
        return weatherCityEntitie.daysTemp.map({
            mapDetailFuturTempDailyViewCellModel(daily: $0)
        })
    }

    private func mapDetailFuturTempDailyViewCellModel(daily: DailyWeather) -> DetailFuturTempDailyViewCellModel {
        return DetailFuturTempDailyViewCellModel(
            date: WeatherTools.convertUnixTimeToDate(unixTime: daily.dt, dateFormat: "EEEE"),
            temp: String("\(Int(WeatherTools.convertKelvinToCelsius(kelvin: daily.temp.day)))°"),
            description: daily.weather[0].description,
            icon: UIImage(named: daily.weather[0].icon) ?? ._01D
        )
    }
}
