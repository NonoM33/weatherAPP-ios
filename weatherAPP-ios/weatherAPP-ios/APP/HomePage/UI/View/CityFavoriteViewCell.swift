//
//  CityFavoriteViewCell.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation
import UIKit

private enum Constants {
    static let iconSize = 55.0
}

final class CityFavoriteViewCell: UITableViewCell {

    private lazy var cityLabel = UILabel(style: .title3)
    private lazy var temperatureLabel = UILabel(style: .title3)
    private lazy var iconTemperature = UIImageView()
    private lazy var horizontalStackView = UIStackView()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func configure(with viewModel: CityFavoriteViewCellModel) {
        cityLabel.text = viewModel.cityName
        temperatureLabel.text = viewModel.temperature
        iconTemperature.image = viewModel.icon
    }

    private func setup() {
        setupHorizontalStackView()
        contentView.addSubview(cityLabel)
        contentView.addSubview(horizontalStackView)
        setupTitleLabel()
        setupLabels()

        NSLayoutConstraint.activate(
            [
                horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                horizontalStackView.centerYAnchor.constraint(
                    equalTo: contentView.centerYAnchor
                ),
                horizontalStackView.rightAnchor.constraint(
                    equalTo: contentView.rightAnchor,
                    constant: -WeatherSpacing.Separator.default.value
                ),
                cityLabel.leftAnchor.constraint(
                    equalTo: contentView.leftAnchor,
                    constant: WeatherSpacing.Separator.default.value
                ),
                cityLabel.rightAnchor.constraint(
                    equalTo: horizontalStackView.leftAnchor,
                    constant: -WeatherSpacing.Separator.default.value
                ),
                cityLabel.centerYAnchor.constraint(
                    equalTo: contentView.centerYAnchor
                )
            ]
        )
    }

    private func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fill
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 8

        horizontalStackView.addArrangedSubview(UIView())
        horizontalStackView.addArrangedSubview(temperatureLabel)
        horizontalStackView.addArrangedSubview(iconTemperature)

        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        iconTemperature.translatesAutoresizingMaskIntoConstraints = false

        iconTemperature.widthAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true
        iconTemperature.heightAnchor.constraint(equalToConstant: Constants.iconSize).isActive = true
    }

    private func setupTitleLabel() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupLabels() {
        [cityLabel, temperatureLabel].forEach({
            $0.textColor = Colors.white
        })
    }
}
