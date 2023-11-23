//
//  DetailFuturTempDailyViewCell.swift
//  weatherAPP-ios
//
//  Created by renaud on 22/11/2023.
//

import Foundation
import UIKit

private enum Constants {
    static let sizeIconHeigth = 20.0
}

class DetailFuturTempDailyViewCell: UICollectionViewCell {

    private lazy var dayLabel = UILabel(style: .description1)
    private lazy var timeLabel = UILabel(style: .body4)
    private lazy var iconImageView = UIImageView()
    private lazy var descriptionLabel = UILabel(style: .description1)
    private lazy var descriptionStackView = createDescriptionStackView()
    private lazy var stackView = UIStackView(style: .default)

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - DetailTimeLineTempViewCell

    func configure(with viewModel: DetailFuturTempDailyViewCellModel) {
        iconImageView.image = viewModel.icon
        dayLabel.text = viewModel.date
        timeLabel.text = viewModel.temp
        descriptionLabel.text = viewModel.description
    }

    // MARK: - Private

    private func setup() {
        (self as UIView).applyStyle(.clear)
        addSubview(stackView)
        setupLabels()
        setupIcon()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = WeatherSpacing.Separator.default.value
        stackView.distribution = .fill
        stackView.alignment = .center

        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(descriptionStackView)
        stackView.addArrangedSubview(UIView())

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupLabels() {
        [dayLabel, timeLabel, descriptionLabel].forEach({
            $0.textColor = Colors.white
            $0.textAlignment = .center
        })
    }

    private func setupIcon() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.sizeIconHeigth),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.sizeIconHeigth)
        ])
    }

    private func createDescriptionStackView() -> UIView {
        let view = UIView()
        view.addSubview(iconImageView)
        view.addSubview(descriptionLabel)

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                iconImageView.topAnchor.constraint(equalTo: view.topAnchor),
                iconImageView.leftAnchor.constraint(equalTo: view.leftAnchor),

                descriptionLabel.leftAnchor.constraint(
                    equalTo: iconImageView.rightAnchor,
                    constant: WeatherSpacing.Separator.small.value
                ),
                descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
            ]
        )
        return view
    }
}
