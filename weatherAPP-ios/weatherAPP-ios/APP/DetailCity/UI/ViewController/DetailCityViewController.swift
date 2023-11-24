//
//  DetailCityViewController.swift
//  weatherAPP-ios
//
//  Created by renaud on 15/11/2023.
//

import Foundation
import UIKit
import WeatherPackage

class DetailCityViewController: UIViewController {

    var presenter: DetailCityViewPresenter?
    private lazy var stackView = UIStackView(style: .default)
    private lazy var divider = createDivider()
    private lazy var detailLocationView = DetailLocationView()
    private lazy var detailTemperatureView = DetailTemperatureView()
    private lazy var detailStatsInfoView = DetailStatsInfoView()
    private lazy var detailTimeLineTempView = DetailTimeLineTempView()
    private lazy var detailFuturTempDaily = DetailFuturTempDailyView()
    private lazy var temperatureLabel = UILabel()
    private lazy var imageCity = UIImageView(style: .rounded)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear
        appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.setBackIndicatorImage(
            UIImage(
                named: "back_arrow"
            ),
            transitionMaskImage: UIImage(
                named: "back_arrow"
            )
        )

        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.tintColor = Colors.white

        if #available(iOS 15, *) {
            self.navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        }
    }

    // MARK: - Private

    private func setup() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Retour",
            style: .plain,
            target: nil,
            action: nil
        )
        view.addSubview(stackView)
        setupStackView()
        setupRightButtonNavBar()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Colors.orange.cgColor, Colors.gray.withAlphaComponent(0.3).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    private func setupRightButtonNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addFavoriteTapped))
        addButton.tintColor = Colors.white
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func addFavoriteTapped() {
        presenter?.addFavorite()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = WeatherSpacing.Separator.large.value
        stackView.addArrangedSubview(detailLocationView)
        stackView.addArrangedSubview(detailTemperatureView)
        stackView.addArrangedSubview(detailStatsInfoView)
        stackView.addArrangedSubview(detailTimeLineTempView)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(detailFuturTempDaily)
        stackView.addArrangedSubview(UIView())

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createDivider() -> UIView {
        let view = UIView()
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.backgroundColor = Colors.white
        view.addSubview(divider)

        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: view.topAnchor),
            divider.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            divider.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: WeatherSpacing.EdgeInsets.horizontal.value.left
            ),
            divider.widthAnchor.constraint(equalToConstant: super.view.bounds.width / 1.1)
        ])
        return view
    }
}

extension DetailCityViewController: DetailCityViewContract {

    // MARK: - DetailCityViewContract

    func display(with viewModel: DetailCityViewModel) {
        detailLocationView.configure(with: viewModel.detailLocationViewModel)
        detailTemperatureView.configure(with: viewModel.detailTemperatureViewModel)
        detailStatsInfoView.configure(with: viewModel.detailStatsInfoViewModel)
        detailTimeLineTempView.configure(with: viewModel.detailTimeLineTempViewmodel)
        detailFuturTempDaily.configure(with: viewModel.detailFuturTempDailyViewModel)
    }
}
