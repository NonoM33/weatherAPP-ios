//
//  HomePageCoordinator.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation
import UIKit
import ADCoordinator

final class HomePageCoordinator: Coordinator {

    // MARK: - private

    private unowned var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Coordinator

    func start() {
        let viewController = HomePageViewController()
        viewController.presenter = DependencyProvider.shared.homePagePresenter(
            viewContract: viewController,
            presenterDelegate: self
        )
        navigationController.pushViewController(viewController, animated: true)
        bindToLifecycle(of: viewController)
    }
}

extension HomePageCoordinator: HomePagePresenterDelegate {}
