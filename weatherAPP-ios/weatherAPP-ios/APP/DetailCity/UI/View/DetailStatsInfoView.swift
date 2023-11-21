//
//  DetailStatsInfoView.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

class DetailStatsInfoView: UIView {

    private lazy var rainView = DetailStatsInfoViewCell()
    private lazy var windView = DetailStatsInfoViewCell()
    private lazy var humidityView = DetailStatsInfoViewCell()
    private lazy var UVIndexView = DetailStatsInfoViewCell()
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

    func configure(with viewModel: DetailStatsInfoViewModel) {
        rainView.configure(with: viewModel.rain)
        windView.configure(with: viewModel.wind)
        humidityView.configure(with: viewModel.humidity)
        UVIndexView.configure(with: viewModel.UVIndex)
    }

    // MARK: - Private

    private func setup() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        [
            rainView,
            windView,
            humidityView,
            UVIndexView
        ].forEach({ stackView.addArrangedSubview($0) })
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        NSLayoutConstraint.activate(
            [
                stackView.leftAnchor.constraint(
                    equalTo: leftAnchor
                ),
                stackView.rightAnchor.constraint(
                    equalTo: rightAnchor
                ),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ]
        )
    }
}
