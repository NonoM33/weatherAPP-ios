//
//  WeatherSpacing.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

private enum SpacingTokens {
    static let extraSmall: CGFloat = 4
    static let small: CGFloat = 8
    static let `default`: CGFloat = 16
    static let large: CGFloat = 24
    static let extraLarge: CGFloat = 48
}

public enum WeatherSpacing {

    // MARK: - Separator

    public enum Separator {
        /// value: 4
        case extraSmall
        /// value: 8
        case small
        /// value: 16
        case `default`
        /// value: 24
        case large
        /// value: 48
        case extraLarge

        public var value: CGFloat {
            switch self {
            case .extraSmall:
                return SpacingTokens.extraSmall
            case .small:
                return SpacingTokens.small
            case .default:
                return SpacingTokens.default
            case .large:
                return SpacingTokens.large
            case .extraLarge:
                return SpacingTokens.extraLarge
            }
        }
    }

    // MARK: - Direction

    public enum EdgeInsetsDirection {
        case all, horizontal, vertical
    }

    // MARK: - ContentViewLayout

    public enum ContentViewLayout {
        case `default`, alert
    }

    // MARK: - EdgeInsets

    public enum EdgeInsets {
        /// value: squared 0
        case none
        /// value: squared 8
        case small
        /// value: squared 4
        case extraSmall
        case horizontal
        case vertical
        case horizontalSmall, verticalSmall

        public var value: UIEdgeInsets {
            switch self {
            case .none:
                return .zero
            case .small:
                return squaredInsets(for: SpacingTokens.small)
            case .extraSmall:
                return squaredInsets(for: SpacingTokens.extraSmall)
            case .horizontal:
                return UIEdgeInsets(
                    top: 0,
                    left: SpacingTokens.default,
                    bottom: 0,
                    right: SpacingTokens.default
                )
            case .vertical:
                return UIEdgeInsets(
                    top: SpacingTokens.default,
                    left: 0,
                    bottom: SpacingTokens.default,
                    right: 0
                )
            case .horizontalSmall:
                return UIEdgeInsets(
                    top: 0,
                    left: SpacingTokens.small,
                    bottom: 0,
                    right: SpacingTokens.small
                )
            case .verticalSmall:
                return UIEdgeInsets(
                    top: SpacingTokens.small,
                    left: 0,
                    bottom: SpacingTokens.small,
                    right: 0
                )
            }
        }

        // MARK: - Private

        private func squaredInsets(for margin: CGFloat) -> UIEdgeInsets {
            return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        }
    }
}

private extension WeatherSpacing.EdgeInsetsDirection {

    // MARK: - G7UISpacing.EdgeInsets.Direction

    var hasHorizontal: Bool {
        return self != .vertical
    }

    var hasVertical: Bool {
        return self != .horizontal
    }
}

private extension WeatherSpacing.ContentViewLayout {

    // MARK: - ContentViewLayout

    var horizontalInset: CGFloat {
        switch self {
        case .default:
            return SpacingTokens.large
        case .alert:
            return SpacingTokens.small
        }
    }

    var verticalInset: CGFloat {
        switch self {
        case .default:
            return SpacingTokens.default
        case .alert:
            return SpacingTokens.small
        }
    }
}
