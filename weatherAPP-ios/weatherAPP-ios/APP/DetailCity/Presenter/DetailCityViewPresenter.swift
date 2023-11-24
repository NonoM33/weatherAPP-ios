//
//  DetailCityViewPresenter.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation

protocol DetailCityViewPresenter {
    func start()
    func addFavorite()
}

protocol DetailCityViewPresenterDelegate: AnyObject {}
