//
//  WeatherCityMapper.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherPackage
import UIKit

class WeatherMapper {
    private let RESTWeatherGlobal: RESTWeatherGlobal

    init(RESTWeatherGlobal: RESTWeatherGlobal) {
        self.RESTWeatherGlobal = RESTWeatherGlobal
    }

    func map() -> WeatherCityEntitie {
        return WeatherCityEntitie(
            cityName: mapCityname(),
            date: mapDate(),
            temperature: mapTemperature(),
            description: mapDescription(),
            rainMm: mapRainMm(),
            windKmh: mapWindKmh(),
            humidityPercent: mapHumidityPercent(),
            UVIndex: mapUVIndex(),
            backgroundColor: mapBackgroundGradientLayer(),
            hourlyTemp: RESTWeatherGlobal.RESTDetaillWeather?.hourly ?? [],
            daysTemp: RESTWeatherGlobal.RESTDetaillWeather?.daily ?? []
        )
    }

    private func mapCityname() -> String {
        return RESTWeatherGlobal.RESTWeatherCity?.name ?? ""
    }

    private func mapDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: Date())
    }

    private func mapTemperature() -> String {
        let temp = RESTWeatherGlobal.RESTWeatherCity?.main?.temp ?? 0
        return String(Int(WeatherTools.convertKelvinToCelsius(kelvin: temp)))
    }

    private func mapDescription() -> String {
        return RESTWeatherGlobal.RESTWeatherCity?.weather?[0].description ?? ""
    }

    private func mapRainMm() -> Int {
        return Int(RESTWeatherGlobal.RESTDetaillWeather?.current.rain?.oneHour ?? 0.0)
    }

    private func mapWindKmh() -> String {
        return (RESTWeatherGlobal.RESTWeatherCity?.wind?.speed ?? 0).formatted(withDecimalPlaces: 1)
    }

    private func mapHumidityPercent() -> Int {
        return Int(RESTWeatherGlobal.RESTDetaillWeather?.current.humidity ?? 0)
    }

    private func mapUVIndex() -> Int {
        return Int(RESTWeatherGlobal.RESTDetaillWeather?.current.uvi ?? 0)
    }

    private func mapBackgroundGradientLayer() -> CAGradientLayer {
        let color = Colors.orange

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.cgColor, UIColor(red: 0.77, green: 0.74, blue: 0.72, alpha: 1).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        return gradientLayer
    }
}
