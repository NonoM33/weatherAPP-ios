//
//  Font.swift
//  weatherAPP-ios
//
//  Created by renaud on 20/11/2023.
//

import UIKit

extension UIFont {
    enum R {
        static var body1 = UIFont.systemFont(ofSize: 14, weight: .regular)
        static var body2 = UIFont.systemFont(ofSize: 16, weight: .bold)
        static var body3 = UIFont.systemFont(ofSize: 14, weight: .bold)
        static var title1 = UIFont.systemFont(ofSize: 16, weight: .bold)
        static var title2 = UIFont.systemFont(ofSize: 32, weight: .bold)
        static var title3 = UIFont.systemFont(ofSize: 40, weight: .regular)
        static var title4 = UIFont.systemFont(ofSize: 64, weight: .semibold)
        static var description1 = UIFont.systemFont(ofSize: 12, weight: .regular)
        static var description2 = UIFont.systemFont(ofSize: 16, weight: .regular)
        static var caption1 = UIFont.systemFont(ofSize: 11, weight: .regular)
        static var caption2 = UIFont.systemFont(ofSize: 12, weight: .bold)
    }
}
