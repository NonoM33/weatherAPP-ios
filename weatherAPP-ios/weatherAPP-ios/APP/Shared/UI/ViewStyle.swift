//
//  ViewStyle.swift
//  weatherAPP-ios
//
//  Created by renaud on 20/11/2023.
//

import Foundation
import UIKit

public struct ViewStyle<T> {

    public let style: (T) -> Void

    public init(style: @escaping (T) -> Void) {
        self.style = style
    }
}

extension ViewStyle {

    public func compose(with style: ViewStyle<T>) -> ViewStyle<T> {
        return ViewStyle<T> {
            self.style($0)
            style.style($0)
        }
    }

    public func compose(with stylingFunction: @escaping (T) -> Void)
    -> ViewStyle<T> {
        return compose(with: ViewStyle<T> {
            stylingFunction($0)
        })
    }
}

public protocol ViewStylable {}

extension UIView: ViewStylable {}
extension UIBarItem: ViewStylable {}
extension UIViewController: ViewStylable {}

extension ViewStylable {

    public func applyStyle(_ style: ViewStyle<Self>) {
        style.style(self)
    }
}

extension ViewStylable where Self: UIView {

    public init(style: ViewStyle<Self>) {
        self.init()
        applyStyle(style)
    }
}
