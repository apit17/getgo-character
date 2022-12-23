//
//  LocationViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import Foundation
import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: LocationViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    private let cellIdentifier = String(describing: LocationEpisodeTableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupNavigation()
        viewModel.getLocations()
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupNavigation() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        title = viewModel.title
    }
}

extension LocationViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchLocations(text: searchController.searchBar.text)
    }
}

extension LocationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! LocationEpisodeTableViewCell
        let viewModel = viewModel.itemFor(row: indexPath.row)
        cell.configureLocation(viewModel: viewModel)
        return cell
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        viewModel.tableViewDidScroll(scrollView: scrollView)
    }
}

extension LocationViewController: LocationViewModelViewDelegate {
    func updateScreen() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
