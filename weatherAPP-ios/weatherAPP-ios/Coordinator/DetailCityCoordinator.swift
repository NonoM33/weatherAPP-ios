//
//  DetailCityCoordinator.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit
import ADCoordinator
import WeatherPackage

class DetailCityCoordinator: Coordinator {

    // MARK: - private

    private unowned var navigationController: UINavigationController
    private var weatherCityEntitie: WeatherCityEntitie

    init(navigationController: UINavigationController,
         weatherCityEntitie: WeatherCityEntitie) {
        self.navigationController = navigationController
        self.weatherCityEntitie = weatherCityEntitie
    }

    // MARK: - Coordinator

    func start() {
        let viewController = DetailCityViewController()
        viewController.presenter = DependencyProvider.shared.detailCityPresenter(
            viewContract: viewController,
            presenterDelegate: self,
            weatherCityEntitie: weatherCityEntitie
        )
        navigationController.pushViewController(viewController, animated: true)
        bindToLifecycle(of: viewController)
    }
}

extension DetailCityCoordinator: DetailCityViewPresenterDelegate {}
