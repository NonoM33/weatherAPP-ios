//
//  DetailTemperatureView.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

class DetailTemperatureView: UIView {

    private lazy var temperatureLabel = UILabel(style: .title4)
    private lazy var descriptionLabel = UILabel(style: .description2)

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - DetailTemperatureView

    func configure(with viewModel: DetailTemperatureViewModel) {
        temperatureLabel.text = viewModel.temperature
        descriptionLabel.text = viewModel.description
    }

    // MARK: - Private

    private func setup() {
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        [temperatureLabel, descriptionLabel].forEach({ addSubview($0) })
        setupLabels()

        NSLayoutConstraint.activate(
            [
                temperatureLabel.topAnchor.constraint(
                    equalTo: topAnchor
                ),
                temperatureLabel.leftAnchor.constraint(
                    equalTo: leftAnchor,
                    constant: WeatherSpacing.EdgeInsets.horizontal.value.left
                ),
                temperatureLabel.bottomAnchor.constraint(
                    equalTo: bottomAnchor
                ),
                descriptionLabel.topAnchor.constraint(
                    equalTo: temperatureLabel.topAnchor,
                    constant: WeatherSpacing.Separator.small.value
                ),
                descriptionLabel.leftAnchor.constraint(
                    equalTo: temperatureLabel.rightAnchor,
                    constant: WeatherSpacing.Separator.large.value
                )
            ]
        )
    }

    private func setupLabels() {
        [temperatureLabel, descriptionLabel].forEach({ $0.textColor = Colors.white })
    }
}
