//
//  HomePagePresenterImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation
import WeatherPackage

final class HomePagePresenterImplementation: HomePagePresenter {

    private var delegate: HomePagePresenterDelegate
    private var viewContract: HomePageViewContract
    private var navigationManager: NavigationManager
    private var weatherCityRepository: WeatherCityRepository

    init(delegate: HomePagePresenterDelegate,
         viewContract: HomePageViewContract,
         navigationManager: NavigationManager,
         weatherCityRepository: WeatherCityRepository) {
        self.delegate = delegate
        self.viewContract = viewContract
        self.navigationManager = navigationManager
        self.weatherCityRepository = weatherCityRepository
    }

    // MARK: - HomePagePresenter

    func start() {
        viewContract.display(HomePageViewModelMapper().map())
    }

    func tapFavorite() {
        guard let navigation = navigationManager.mainViewController else { return }
        let coordinator = CitySearchCoorindator(navigationController: navigation)
        coordinator.start()
    }

    func getCityFavorite(lat: Double, lon: Double) {
        guard let navigation = navigationManager.mainViewController else { return }
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
