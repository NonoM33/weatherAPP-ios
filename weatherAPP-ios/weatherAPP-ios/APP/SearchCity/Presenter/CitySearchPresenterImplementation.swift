//
//  CitySearchPresenterImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import WeatherPackage

class CitySearchPresenterImplementation: CitySearchPresenter {

    private weak var delegate: CitySearchPresenterDelegate?
    private var viewContract: CitySearchViewContract?
    private var navigationManager: NavigationManager
    private var weatherCityRepository: WeatherCityRepository

    init(delegate: CitySearchPresenterDelegate,
         viewContract: CitySearchViewContract,
         navigationManager: NavigationManager,
         weatherCityRepository: WeatherCityRepository) {
        self.delegate = delegate
        self.viewContract = viewContract
        self.navigationManager = navigationManager
        self.weatherCityRepository = weatherCityRepository
    }

    // MARK: - CitySearchPresenter

    func start() {
        viewContract?.display(CitySearchViewModelMapper().map())
    }

    func selectCityWithCoordinates(lon: Double, lat: Double) {
        weatherCityRepository.getByCoordonate(lon: lon, lat: lat) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherEntitie):
                let coordinator = DetailCityCoordinator(
                    navigationController:
                        self.navigationManager.mainViewController,
                    weatherCityEntitie: weatherEntitie
                )
                coordinator.start()
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
