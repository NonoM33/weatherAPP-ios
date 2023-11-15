//
//  WeatherCityRepository.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import WeatherKITCustom

protocol WeatherCityRepository {
    func getByCoordonate(lon: Double, lat: Double, completion: @escaping (Result<WeatherCityEntitie, Error>) -> Void)
}
