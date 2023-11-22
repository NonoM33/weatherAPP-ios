//
//  UICollectionView+Style.swift
//  weatherAPP-ios
//
//  Created by renaud on 22/11/2023.
//

import Foundation
import UIKit

extension ViewStyle where T == UICollectionView {

    static let `default` = ViewStyle<UICollectionView> {
        $0.backgroundColor = .clear
    }
}

extension UICollectionView {

    convenience init(style: ViewStyle<UICollectionView>,
                     direction: ScrollDirection = .vertical) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        self.init(frame: .zero, collectionViewLayout: layout)
        configure(with: style)
    }

    // MARK: - Private

    private func configure(with style: ViewStyle<UICollectionView>) {
        applyStyle(style)
    }
}
