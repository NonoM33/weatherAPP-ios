//
//  HomePageViewController.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation
import UIKit

final class HomePageViewController: UIViewController {

    var presenter: HomePagePresenter?
    private lazy var cityFavoriteView = CityFavoriteView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - Private

   private func setup() {
       view.applyStyle(.Primary)
       setupRightButtonNavBar()
       view.addSubview(cityFavoriteView)
       setupCityFavoriteView()
    }

    private func setupCityFavoriteView() {
        cityFavoriteView.delegate = self
        cityFavoriteView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                cityFavoriteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                cityFavoriteView.rightAnchor.constraint(
                    equalTo: view.rightAnchor,
                    constant: -WeatherSpacing.EdgeInsets.horizontal.value.right
                ),
                cityFavoriteView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                cityFavoriteView.leftAnchor.constraint(
                    equalTo: view.leftAnchor,
                    constant: WeatherSpacing.EdgeInsets.horizontal.value.left
                )
            ]
        )
    }

    private func setupRightButtonNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFaoriteTapped))
        addButton.tintColor = Colors.white
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func addFaoriteTapped() {
        presenter?.tapFavorite()
    }
}

extension HomePageViewController: HomePageViewContract {

    // MARK: - HomePageViewContract
    func display(_ viewModel: HomePageViewModel) {
    }
}
