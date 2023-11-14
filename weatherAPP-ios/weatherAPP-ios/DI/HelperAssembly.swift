//
//  HelperAssembly.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import Swinject

class HelperAssembly: Assembly {

    // MARK: - Assembly

    func assemble(container: Container) {

        container.register(NavigationManager.self) { _ in
            NavigationManager.shared
        }
        .inObjectScope(.container)
    }
}
