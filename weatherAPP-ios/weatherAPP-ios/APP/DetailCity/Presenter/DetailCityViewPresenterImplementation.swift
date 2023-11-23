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
    private var weatherCityEntitie: WeatherCityEntitie
    private var viewModel: DetailCityViewModel?

    init(delegate: DetailCityViewPresenterDelegate,
         viewContract: DetailCityViewContract,
         weatherCityEntitie: WeatherCityEntitie) {
        self.delegate = delegate
        self.viewContract = viewContract
        self.weatherCityEntitie = weatherCityEntitie
    }

    // MARK: - DetailCityViewPresenter

    func start() {
        self.viewContract.display(with: DetailCityViewModelMapper(weatherCityEntitie: weatherCityEntitie).map())
    }
}
