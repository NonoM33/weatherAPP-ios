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
            icon: mapIcon(),
            backgroundColor: mapBackgroundGradientLayer()
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
        let temp = RESTWeatherGlobal.RESTWeatherCity?.main.temp ?? 0
        return String(Int(WeatherTools.convertKelvinToCelsius(kelvin: temp)))
    }

    private func mapDescription() -> String {
        return RESTWeatherGlobal.RESTWeatherCity?.weather[0].description ?? ""
    }

    private func mapRainMm() -> String {
        let rain = RESTWeatherGlobal.RESTDetaillWeather?.current.rain?.oneHour ?? 0.0
        return String(rain)
    }

    private func mapWindKmh() -> String {
        let wind = RESTWeatherGlobal.RESTWeatherCity?.wind.speed ?? 0
        return String(wind)
    }

    private func mapHumidityPercent() -> String {
        let humidity = RESTWeatherGlobal.RESTDetaillWeather?.current.humidity ?? 0
        return String(humidity)
    }

    private func mapUVIndex() -> String {
        let uvi = RESTWeatherGlobal.RESTDetaillWeather?.current.uvi ?? 0
        return String(uvi)
    }

    private func mapIcon() -> UIImage? {
        guard let icon = RESTWeatherGlobal.RESTWeatherCity?.weather[0].icon else { return nil }
        return WeatherTools.iconTemperature(icon: icon)
    }

    private func mapBackgroundGradientLayer() -> CAGradientLayer {
        let temp = RESTWeatherGlobal.RESTWeatherCity?.main.temp ?? 0
        let color = WeatherTools.colorForTemperature(kelvin: temp)

        // Créer un dégradé en fonction de la couleur de température
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        return gradientLayer
    }
}
