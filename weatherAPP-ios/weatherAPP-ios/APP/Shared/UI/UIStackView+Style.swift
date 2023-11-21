//
//  UIStackView+Style.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

private enum StackViewStyle {
    case `default`, tiny, extraSmall, small, large, extraLarge, wide

    var spacing: CGFloat {
        switch self {
        case .default:
            return 0.0
        case .tiny:
            return 1.0
        case .extraSmall:
            return WeatherSpacing.Separator.extraSmall.value
        case .small:
            return WeatherSpacing.Separator.small.value
        case .large:
            return WeatherSpacing.Separator.default.value
        case .extraLarge:
            return WeatherSpacing.Separator.large.value
        case .wide:
            return WeatherSpacing.Separator.extraLarge.value
        }
    }
}

extension ViewStyle where T == UIStackView {

    // MARK: - Public

    public static let `default` = ViewStyle<UIStackView> {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = StackViewStyle.default.spacing
    }

    public static let centered = ViewStyle<UIStackView>.default.compose(with: .centeredViews)

    public static let extraSmall = ViewStyle<UIStackView>.default.compose(with: .styleSpacing(.extraSmall))

    public static let extraSmallCentered = ViewStyle<UIStackView>.extraSmall.compose(with: .centeredViews)

    public static let small = ViewStyle<UIStackView>.default.compose(with: .styleSpacing(.small))

    public static let large = ViewStyle<UIStackView>.default.compose(with: .styleSpacing(.large))

    public static let extraLarge = ViewStyle<UIStackView>.default.compose(with: .styleSpacing(.extraLarge))

    public static let wide = ViewStyle<UIStackView>.default.compose(with: .styleSpacing(.wide))

    public static let fillEqually = ViewStyle<UIStackView>.default.compose(with: .distribution(.fillEqually))

    public static let fillProportionally = ViewStyle<UIStackView>.default
        .compose(with: .distribution(.fillProportionally))

    public static let smallFillEqually = ViewStyle<UIStackView>.small.compose(with: .distribution(.fillEqually))

    public static let smallCentered = ViewStyle<UIStackView>.small.compose(with: .centeredViews)

    public static let largeCentered = ViewStyle<UIStackView>.large.compose(with: .centeredViews)

    public static let extraLargeCentered = ViewStyle<UIStackView>.extraLarge.compose(with: .centeredViews)

    public static let wideCentered = ViewStyle<UIStackView>.wide.compose(with: .centeredViews)

    public static let extraLargeFillProportionally = ViewStyle<UIStackView>.fillProportionally
        .compose(with: .styleSpacing(.extraLarge))

    public static let horizontal = ViewStyle<UIStackView>.default.compose(with: .horizontalAxis)

    public static let horizontalCenter = ViewStyle<UIStackView>.horizontal.compose { $0.alignment = .center }

    public static let horizontalExtraSmall = ViewStyle<UIStackView>.extraSmall.compose(with: .horizontalAxis)

    public static let horizontalSmall = ViewStyle<UIStackView>.small.compose(with: .horizontalAxis)

    public static let horizontalSmallCentered = ViewStyle<UIStackView>.smallCentered.compose(with: .horizontalAxis)

    public static let horizontalLarge = ViewStyle<UIStackView>.large.compose(with: .horizontalAxis)

    public static let horizontalExtraLarge = ViewStyle<UIStackView>.extraLarge.compose(with: .horizontalAxis)

    public static let horizontalLargeCentered = ViewStyle<UIStackView>.largeCentered.compose(with: .horizontalAxis)

    public static let horizontalFill = ViewStyle<UIStackView>.fill.compose(with: .horizontalAxis)

    public static let horizontalFillSmall = ViewStyle<UIStackView>.horizontalFill
        .compose(with: .styleSpacing(.small))

    public static let horizontalFillEqually = ViewStyle<UIStackView>.fillEqually.compose(with: .horizontalAxis)

    public static let horizontalFillEquallyTiny = ViewStyle<UIStackView>.horizontalFillEqually
        .compose(with: .styleSpacing(.tiny))

    public static let horizontalFillEquallySmall = ViewStyle<UIStackView>.horizontalFillEqually
        .compose(with: .styleSpacing(.small))

    public static let horizontalFillEquallyLarge = ViewStyle<UIStackView>.horizontalFillEqually
        .compose(with: .styleSpacing(.large))

    public static let horizontalFillProportionally = ViewStyle<UIStackView>.fillProportionally
        .compose(with: .horizontalAxis)

    public static let horizontalFillProportionallyExtraSmall = ViewStyle<UIStackView>.horizontalFillProportionally
        .compose(with: .extraSmall)

    public static let equalSpacingCentered = ViewStyle<UIStackView>.centered
        .compose(with: .distribution(.equalSpacing))

    public static let largeEqualSpacingCentered = ViewStyle<UIStackView>.equalSpacingCentered
        .compose(with: .styleSpacing(.large))

    // MARK: - Internal

    static let horizontalEqualSpacing = ViewStyle<UIStackView>.horizontal
        .compose(with: .distribution(.equalSpacing))

    // MARK: - Private

    private static let fill = ViewStyle<UIStackView>.default
        .compose(with: .distribution(.fill))

    private static let centeredViews = ViewStyle<UIStackView> {
        $0.alignment = .center
    }

    private static let horizontalAxis = ViewStyle<UIStackView> {
        $0.axis = .horizontal
    }

    private static func distribution(_ distribution: UIStackView.Distribution) -> ViewStyle<UIStackView> {
        return ViewStyle<UIStackView> { $0.distribution = distribution }
    }

    private static func styleSpacing(_ style: StackViewStyle) -> ViewStyle<UIStackView> {
        return ViewStyle<UIStackView> { $0.spacing = style.spacing }
    }
}
