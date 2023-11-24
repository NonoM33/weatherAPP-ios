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

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private

    func setup() {
        view.backgroundColor = Colors.gray
        setupRightButtonNavBar()
    }

    func setupRightButtonNavBar() {
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
