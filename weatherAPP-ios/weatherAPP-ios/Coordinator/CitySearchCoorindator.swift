//
//  CitySearchCoorindator.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import UIKit
import ADCoordinator

class CitySearchCoorindator: Coordinator {

    // MARK: - private

    private unowned var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        let viewController = CitySearchViewController()
        viewController.presenter = DependencyProvider.shared.citySearchPresenter(
            viewContract: viewController,
            presenterDelegate: self
        )
        navigationController.pushViewController(viewController, animated: true)
        bindToLifecycle(of: viewController)
    }
}

extension CitySearchCoorindator: CitySearchPresenterDelegate {}
