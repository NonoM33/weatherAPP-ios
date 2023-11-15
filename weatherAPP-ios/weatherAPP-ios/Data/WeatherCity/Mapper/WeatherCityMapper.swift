//
//  WeatherCityMapper.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherKITCustom

class WeatherMapper {
    private let restWeahterCity: RESTWeatherCity

    init(restWeahterCity: RESTWeatherCity) {
        self.restWeahterCity = restWeahterCity
    }

    func map() -> WeatherCityEntitie {
        return WeatherCityEntitie(
            main: restWeahterCity.weather[0].main,
            icon_name: restWeahterCity.weather[0].icon
        )
    }
}
