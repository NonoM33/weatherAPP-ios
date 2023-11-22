//
//  DetailFuturTempDailyView.swift
//  weatherAPP-ios
//
//  Created by renaud on 22/11/2023.
//

import Foundation
import UIKit

private enum Constants {
    static let reuseIdentifier = "DetailFuturTempDailyViewCell"
    static let fatalError = "Unable to dequeue DetailTimeLineTempViewCell"
}

class DetailFuturTempDailyView: UIView {

    private lazy var collectionView = UICollectionView(style: .default)
    private var timeCellsModels = [DetailFuturTempDailyViewCellModel]()

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - DetailTimeLineTempView

    func configure(with viewModel: DetailFuturTempDailyViewModel) {
        timeCellsModels = viewModel.detailFuturTempDailyViewCellsModels
        collectionView.reloadData()
    }

    // MARK: - Private

    private func setup() {
        addSubview(collectionView)
        setupCollectionView()

    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(
            DetailFuturTempDailyViewCell.self,
            forCellWithReuseIdentifier: Constants.reuseIdentifier
        )

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}

extension DetailFuturTempDailyView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 120)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension DetailFuturTempDailyView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return timeCellsModels.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.reuseIdentifier,
            for: indexPath
        ) as? DetailFuturTempDailyViewCell else {
            fatalError(
                Constants.fatalError
            )
        }

        let model = timeCellsModels[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension DetailFuturTempDailyView: UICollectionViewDelegate {}
