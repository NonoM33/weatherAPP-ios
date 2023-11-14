//
//  CitySearchPresenterImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation

class CitySearchPresenterImplementation: CitySearchPresenter {

    private weak var delegate: CitySearchPresenterDelegate?
    private var viewContract: CitySearchViewContract?

    init(delegate: CitySearchPresenterDelegate,
         viewContract: CitySearchViewContract) {
        self.delegate = delegate
        self.viewContract = viewContract
    }

    // MARK: - CitySearchPresenter

    func start() {
        viewContract?.display(CitySearchViewModelMapper().map())
    }

    func selectCityWithCoordinates(lon: Double, lat: Double) {}
}
