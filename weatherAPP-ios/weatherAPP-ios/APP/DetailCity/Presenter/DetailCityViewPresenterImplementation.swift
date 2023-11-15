//
//  DetailCityViewPresenterImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation

class DetailCityViewPresenterImplementation: DetailCityViewPresenter {

    private var delegate: DetailCityViewPresenterDelegate
    private var viewContract: DetailCityViewContract

    init(delegate: DetailCityViewPresenterDelegate, viewContract: DetailCityViewContract) {
        self.delegate = delegate
        self.viewContract = viewContract
    }

    // MARK: - DetailCityViewPresenter

    func start() {}
}
