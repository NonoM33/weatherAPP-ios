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
    private var navigationManager: NavigationManager

    init(delegate: DetailCityViewPresenterDelegate,
         viewContract: DetailCityViewContract,
         weatherCityEntitie: WeatherCityEntitie,
         navigationManager: NavigationManager) {
        self.delegate = delegate
        self.viewContract = viewContract
        self.weatherCityEntitie = weatherCityEntitie
        self.navigationManager = navigationManager
    }

    // MARK: - DetailCityViewPresenter

    func start() {
        self.viewContract.display(with: DetailCityViewModelMapper(weatherCityEntitie: weatherCityEntitie).map())
    }

    func addFavorite() {
        navigationManager.popToRootViewController(animated: true)
    }
}
