//
//  DetailCityViewController.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit

class DetailCityViewController: UIViewController {

    var presenter: DetailCityViewPresenter?
    private lazy var detailTemperatureView = DetailTemperatureView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - Private

    private func setup() {
        stackView.addArrangedSubview(detailTemperatureView)
    }
}

extension DetailCityViewController: DetailCityViewContract {

    // MARK: - DetailCityViewContract

    func display(_ viweModel: DetailCityViewModel) {
    }
}
