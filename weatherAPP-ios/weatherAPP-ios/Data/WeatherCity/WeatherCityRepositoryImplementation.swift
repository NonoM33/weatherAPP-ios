//
//  WeatherCityRepositoryImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherKITCustom

class WeatherCityRepositoryImplementation: WeatherCityRepository {

    let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    // MARK: - WeatherCityRepository

    func getByCoordonate(lon: Double, lat: Double, completion: @escaping (Result<WeatherCityEntitie, Error>) -> Void) {
        apiClient.fetchWeatherForCity(latitude: lat, longitude: lon) { result in
            switch result {
            case .success(let restWeather):
                let weatherEntitie = WeatherMapper(restWeahterCity: restWeather).map()
                completion(.success(weatherEntitie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
