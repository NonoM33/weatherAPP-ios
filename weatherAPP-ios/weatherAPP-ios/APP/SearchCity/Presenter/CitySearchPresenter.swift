//
//  CitySearchPresenter.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation

protocol CitySearchPresenter {
    func start()
    func selectCityWithCoordinates(lon: Double, lat: Double)
}

protocol CitySearchPresenterDelegate: AnyObject {}
