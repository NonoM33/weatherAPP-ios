//
//  PresenterAssembly.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
// swiftlint: disable force_unwrapping

import Foundation
import Swinject

class PresenterAssembly: Assembly {

    // MARK: - Assembly

    func assemble(container: Container) {

        container.register(CitySearchPresenter.self) { r, viewcontract, delegate in
            CitySearchPresenterImplementation(
                delegate: delegate,
                viewContract: viewcontract,
                navigationManager: r.resolve(NavigationManager.self)!,
                weatherCityRepository: r.resolve(WeatherCityRepository.self)!
            )
        }

        container.register(DetailCityViewPresenter.self) { _, viewcontract, delegate, weatherCityEntitie in
            DetailCityViewPresenterImplementation(
                delegate: delegate,
                viewContract: viewcontract,
                weatherCityEntitie: weatherCityEntitie
            )
        }
    }
}
