//
//  CornerRadius.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import UIKit
import Foundation

public enum CornerRadius {

    case small, `default`, largeTopOnly, overlay, overlayContent, navigation, loyalty

    public var value: CGFloat {
        switch self {
        case .small:
            return 4
        case .default:
            return 8
        case .largeTopOnly, .loyalty:
            return 16
        case .navigation, .overlayContent:
            return 20
        case .overlay:
            return 24
        }
    }

    public var mask: CACornerMask {
        switch self {
        case .small, .default, .overlayContent, .navigation, .loyalty:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .largeTopOnly, .overlay:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
}
