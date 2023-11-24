//
//  CityFavoriteView.swift
//  weatherAPP-ios
//
//  Created by renaud on 24/11/2023.
//

import Foundation
import UIKit

protocol CityFavoriteViewDelegate: AnyObject {
    func cityFavoriteView(_ view: CityFavoriteView, didSelectCity lat: Double, lon: Double)
}

private enum Constants {
    static let reuseIdentifier = "CityFavoriteViewCell"
}

final class CityFavoriteView: UIView {

    weak var delegate: CityFavoriteViewDelegate?
    private lazy var tableView = UITableView()
    private var cellsModel = [CityFavoriteViewCellModel]()

    // MARK: - UIView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - CityFavoriteView

    func configure(with viewModel: CityFavoriteViewModel) {
        cellsModel = viewModel.cityFavoriteViewCellsModels
        tableView.reloadData()
    }

    // MARK: - Private

    private func setup() {
        (self as UIView).applyStyle(.Primary)
        addSubview(tableView)
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(CityFavoriteViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}

extension CityFavoriteView: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Supprimer"
        ) { (_, _, completionHandler) in
            // Mettre à jour votre modèle de données ici
            self.cellsModel.remove(at: indexPath.row)

            // Supprimer la ligne de la table avec une animation
            tableView.deleteRows(at: [indexPath], with: .fade)

            // Exécuter le gestionnaire de complétion
            completionHandler(true)

            // Ajouter d'autres logiques de suppression si nécessaire
        }

        // Vous pouvez personnaliser davantage l'action ici (par exemple, en définissant une image)
         deleteAction.image = UIImage(named: "delete_icon")

        // Créer et retourner une configuration d'actions de swipe
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

extension CityFavoriteView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsModel.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.reuseIdentifier,
            for: indexPath
        ) as? CityFavoriteViewCell else {
            fatalError("Unable to dequeue CityFavoriteViewCell")
        }
        cell.configure(with: cellsModel[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cityFavoriteView(
            self,
            didSelectCity: cellsModel[indexPath.row].lat,
            lon: cellsModel[indexPath.row].lon
        )
    }
}
