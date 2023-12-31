//
//  HomePagePresenter.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation

protocol HomePagePresenter {
    func start()
    func tapFavorite()
    func getCityFavorite(lat: Double, lon: Double)
}

protocol HomePagePresenterDelegate: AnyObject {}
