//
//  UIVIew+Style.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

extension ViewStyle where T == UIView {

    public static let clear = ViewStyle<UIView> {
        $0.backgroundColor = .clear
    }

    public static let Primary = ViewStyle<UIView> {
        $0.backgroundColor = .darkGray
    }

    public static let rounded = ViewStyle<UIView> {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = CornerRadius.default.value
    }

    public static let blurred = ViewStyle<UIView> {
        $0.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = $0.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.addSubview(blurEffectView)
    }
}
