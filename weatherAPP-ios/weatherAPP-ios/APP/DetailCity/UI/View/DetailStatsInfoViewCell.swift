//
//  DetailStatsInfoViewCell.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

class DetailStatsInfoViewCell: UIView {

    private lazy var valueLabel = UILabel(style: .title3)
    private lazy var descriptionLabel = UILabel(style: .description2)
    private lazy var precisionLabel = UILabel(style: .description1)
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

    // MARK: - DetailStatsInfoView

    func configure(with viewModel: DetailStatsInfoViewCellModel) {
        valueLabel.text = viewModel.value
        descriptionLabel.text = viewModel.description
        precisionLabel.text = viewModel.precision
    }

    // MARK: - Private

    private func setup() {

        addSubview(stackView)
        setupLabels()

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(precisionLabel)

        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setupLabels() {
        [valueLabel, descriptionLabel, precisionLabel].forEach({
            $0.textColor = Colors.white
            $0.textAlignment = .center
        })
    }
}
