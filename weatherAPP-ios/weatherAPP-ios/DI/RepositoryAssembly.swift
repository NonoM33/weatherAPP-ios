//
//  RepositoryAssembly.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
// swiftlint:disable force_unwrapping

import Foundation
import Swinject
import WeatherPackage

class RepositoryAssembly: Assembly {

    // MARK: - Assembly

    func assemble(container: Container) {

        container.register(WeatherCityRepository.self) { r in
            WeatherCityRepositoryImplementation(
                weatherService: r.resolve(WeatherService.self)!
            )
        }
        .inObjectScope(.container)
    }
}
