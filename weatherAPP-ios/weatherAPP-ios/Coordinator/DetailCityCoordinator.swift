//
//  DetailCityCoordinator.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit
import ADCoordinator

class DetailCityCoordinator: Coordinator {

    // MARK: - private

    private unowned var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        let viewController = DetailCityViewController()
        viewController.presenter = DependencyProvider.shared.detailCityPresenter(
            viewContract: viewController,
            presenterDelegate: self
        )
        navigationController.pushViewController(viewController, animated: true)
        bindToLifecycle(of: viewController)
    }
}

extension DetailCityCoordinator: DetailCityViewPresenterDelegate {}
