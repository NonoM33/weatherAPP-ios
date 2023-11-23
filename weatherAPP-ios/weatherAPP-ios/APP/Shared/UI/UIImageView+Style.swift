//
//  UIImageView+Style.swift
//  weatherAPP-ios
//
//  Created by renaud on 21/11/2023.
//

import Foundation
import UIKit

extension ViewStyle where T == UIImageView {

    public static let rounded = ViewStyle<UIImageView> {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = CornerRadius.default.value
    }
}
