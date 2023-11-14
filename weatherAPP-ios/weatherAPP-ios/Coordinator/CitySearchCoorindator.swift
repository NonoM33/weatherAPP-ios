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
        let viewControler = CitySearchViewController()
        viewControler.presenter = DependencyProvider.shared.citySearchPresenter(
            viewContract: viewControler,
            presenterDelegate: self
        )
        navigationController.pushViewController(viewControler, animated: true)
        bindToLifecycle(of: viewControler)
    }
}

extension CitySearchCoorindator: CitySearchPresenterDelegate {}
