//
//  DetailTimeLineTempViewCell.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

private enum Constants {
    static let iconHeiht = 35.0
}

class DetailTimeLineTempViewCell: UICollectionViewCell {

    private lazy var valueLabel = UILabel(style: .body3)
    private lazy var iconImageView = UIImageView()
    private lazy var timeLabel = UILabel(style: .body3)
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

    func configure(with viewModel: DetailTimeLineTempViewCellModel) {
        valueLabel.text = viewModel.value
        iconImageView.image = viewModel.icon
        timeLabel.text = viewModel.time
        backgroundColor = .clear

        if viewModel.isNow {
            backgroundColor = .black.withAlphaComponent(0.4)
        }
    }

    // MARK: - Private

    private func setup() {
        (self as UIView).applyStyle(.rounded)
        addSubview(stackView)
        setupLabels()
        setupIcon()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = WeatherSpacing.Separator.default.value
        stackView.distribution = .fill

        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(timeLabel)
        stackView.addArrangedSubview(UIView())

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupLabels() {
        [valueLabel, timeLabel].forEach({
            $0.textColor = Colors.white
            $0.textAlignment = .center
        })
    }

    private func setupIcon() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.heightAnchor.constraint(
            equalToConstant: Constants.iconHeiht
        ).isActive = true
    }
}
