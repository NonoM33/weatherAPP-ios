//
//  HomePagePresenterImplementation.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation

final class HomePagePresenterImplementation: HomePagePresenter {

    private var delegate: HomePagePresenterDelegate
    private var viewContract: HomePageViewContract
    private var navigationManager: NavigationManager

    init(delegate: HomePagePresenterDelegate,
         viewContract: HomePageViewContract,
         navigationManager: NavigationManager) {
        self.delegate = delegate
        self.viewContract = viewContract
        self.navigationManager = navigationManager
    }

    // MARK: - HomePagePresenter

    func start() {
        viewContract.display(HomePageViewModelMapper().map())
    }

    func tapFavorite() {
        guard let navigation = navigationManager.mainViewController else { return }
        let coordinator = CitySearchCoorindator(navigationController: navigation)
        coordinator.start()
    }
}
