//
//  WeatherCityRepositoryImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherPackage
import UIKit

class WeatherCityRepositoryImplementation: WeatherCityRepository {

    let weatherService: WeatherService

    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }

    // MARK: - WeatherCityRepository

    func getByCoordonate(lon: Double, lat: Double, completion: @escaping (Result<WeatherCityEntitie, Error>) -> Void) {
        weatherService.fetchCurrentWeather(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let restWeather):
                let weatherEntitie = WeatherMapper(RESTWeatherGlobal: restWeather).map()
                completion(.success(weatherEntitie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
