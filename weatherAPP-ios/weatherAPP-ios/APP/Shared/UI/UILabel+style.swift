//
//  UILabel+style.swift
//  weatherAPP-ios
//
//  Created by renaud on 20/11/2023.
//

import Foundation
import UIKit

extension ViewStyle where T == UILabel {

    public static let title1 = base.compose {
        $0.font = UIFont.R.title1
    }

    public static let title2 = base.compose {
        $0.font = UIFont.R.title2
    }

    public static let title3 = base.compose {
        $0.font = UIFont.R.title3
    }

    public static let title4 = base.compose {
        $0.font = UIFont.R.title4
    }

    public static let body1 = base.compose {
        $0.font = UIFont.R.body1
    }

    public static let body2 = base.compose {
        $0.font = UIFont.R.body2
    }

    public static let body3 = base.compose {
        $0.font = UIFont.R.body3
    }

    public static let body4 = base.compose {
        $0.font = UIFont.R.body4
    }

    public static let description1 = base.compose {
        $0.font = UIFont.R.description1
    }

    public static let description2 = base.compose {
        $0.font = UIFont.R.description2
    }

    public static let caption1 = base.compose {
        $0.font = UIFont.R.caption1
    }

    public static let caption2 = base.compose {
        $0.font = UIFont.R.caption2
    }

    public static let info1 = base.compose {
        $0.font = UIFont.R.caption2
        $0.textColor = Colors.black
    }

    // MARK: - Private

    private static let base = ViewStyle<UILabel> {
        $0.textColor = Colors.black
        $0.numberOfLines = 0
        $0.adjustsFontForContentSizeCategory = true
    }
}
