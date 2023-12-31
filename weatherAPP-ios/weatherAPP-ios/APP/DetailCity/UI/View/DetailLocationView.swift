//
//  DetailLocationView.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

private enum Constants {
    static let isTodayLabelText = "Aujourd'hui"
}

class DetailLocationView: UIView {

    private lazy var stackView = UIStackView(style: .default)
    private lazy var locationLabel = UILabel(style: .title2)
    private lazy var divider = createDivider()
    private lazy var dateView = createDateView()
    private lazy var isTodayLabel = UILabel(style: .description2)
    private lazy var dateLabel = UILabel(style: .body2)

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - DetailLocationView

    func configure(with viewModel: DetailLocationViewModel) {
        self.locationLabel.text = viewModel.location
        self.dateLabel.text = viewModel.date
        self.isTodayLabel.text = Constants.isTodayLabelText
    }

    // MARK: - Private

    private func setup() {
        addSubview(stackView)
        setupStackView()
        setupLabels()
    }

    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.spacing = WeatherSpacing.Separator.default.value
        stackView.distribution = .equalSpacing

        [locationLabel, divider, dateView].forEach({ stackView.addArrangedSubview($0) })
        NSLayoutConstraint.activate(
            [
                stackView.leftAnchor.constraint(
                    equalTo: leftAnchor,
                    constant: WeatherSpacing.EdgeInsets.horizontal.value.left
                ),
                stackView.rightAnchor.constraint(
                    equalTo: rightAnchor,
                    constant: -WeatherSpacing.EdgeInsets.horizontal.value.right
                ),
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }

    private func createDateView() -> UIView {
        let view = UIView()

        view.addSubview(isTodayLabel)
        view.addSubview(dateLabel)

        isTodayLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                isTodayLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
                isTodayLabel.topAnchor.constraint(equalTo: view.topAnchor),
                isTodayLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                dateLabel.topAnchor.constraint(equalTo: view.topAnchor),
                dateLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                dateLabel.leftAnchor.constraint(
                    equalTo: isTodayLabel.rightAnchor,
                    constant: WeatherSpacing.Separator.small.value
                )
            ]
        )
        return view
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
                equalTo: view.leftAnchor
            ),
            divider.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1.0 / 1.5
            )
        ])
        return view
    }

    private func setupLabels() {
        [dateLabel, locationLabel, isTodayLabel].forEach({ $0.textColor = Colors.white })
    }
}
