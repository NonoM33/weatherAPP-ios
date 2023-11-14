//
//  PresenterAssembly.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import Swinject

class PresenterAssembly: Assembly {

    // MARK: - Assembly

    func assemble(container: Container) {

        container.register(CitySearchPresenter.self) { _, viewcontract, delegate in
            CitySearchPresenterImplementation(
                delegate: delegate,
                viewContract: viewcontract
            )
        }
    }
}
