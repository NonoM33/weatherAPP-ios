//
//  CitySearchViewController.swift
//  weatherAPP-ios
//
//  Created by renaud on 13/11/2023.
//

import Foundation
import UIKit
import MapKit

private enum Constants {
    static let cellName = "cell"
}

class CitySearchViewController: UITableViewController {

    var presenter: CitySearchPresenter?
    var searchCompleter = MKLocalSearchCompleter()
    var searchResults = [MKLocalSearchCompletion]()

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.start()
    }

    // MARK: - Private

    private func setup() {
        view.backgroundColor = Colors.black
        setupSearchController()
        setupUISearchController()
        setupSearchCompleter()
        setupTableView()
    }

    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
    }

    private func setupUISearchController() {
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func setupSearchCompleter() {
        searchCompleter.delegate = self
        searchCompleter.resultTypes = .address
    }

    private func setupTableView() {
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: Constants.cellName
        )
    }
}

extension CitySearchViewController: CitySearchViewContract {

    // MARK: - CitySearchViewContract

    func display(_ viewModel: CitySearchViewModel) {
        searchController.searchBar.placeholder = viewModel.searchBarPlaceholder
    }
}

extension CitySearchViewController {

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellName,
            for: indexPath
        )
        let searchResult = searchResults[indexPath.row]
        cell.textLabel?.text = "\(searchResult.title), \(searchResult.subtitle)"
        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchCompletion = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: searchCompletion)
        let search = MKLocalSearch(request: searchRequest)
        search.start { [weak self] (response, error) in
            guard let self = self else { return }
            guard let response = response, error == nil else {
                print("Search error: \(error?.localizedDescription ?? "unknown")")
                return
            }
            let coordinate = response.mapItems[0].placemark.coordinate
            let latitude = coordinate.latitude
            let longitude = coordinate.longitude
            self.presenter?.selectCityWithCoordinates(lon: longitude, lat: latitude)
        }
    }
}

extension CitySearchViewController: UISearchResultsUpdating {

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        searchCompleter.queryFragment = searchController.searchBar.text ?? ""
    }
}

extension CitySearchViewController: MKLocalSearchCompleterDelegate {

    // MARK: - MKLocalSearchCompleterDelegate

    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        tableView.reloadData()
    }

    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        // Handle error
        print(error.localizedDescription)
    }
}
