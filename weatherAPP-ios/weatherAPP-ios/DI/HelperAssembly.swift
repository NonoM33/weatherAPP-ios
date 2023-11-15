//
//  HelperAssembly.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import Swinject
import WeatherKITCustom

class HelperAssembly: Assembly {

    // MARK: - Assembly

    func assemble(container: Container) {

        container.register(NavigationManager.self) { _ in
            NavigationManager.shared
        }
        .inObjectScope(.container)

        container.register(APIClient.self) { _ in
            APIClient(session: URLSession(configuration: .default))
        }
        .inObjectScope(.container)
    }
}
