//
//  CharacterViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 19/12/22.
//

import Foundation
import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var viewModel: CharacterViewModelType! {
        didSet {
            viewModel.viewDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigation()
        viewModel.getCharacters()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.setRightBarButton(viewModel.barItem(), animated: false)
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        title = viewModel.title
    }

    private func setupCollectionView() {
        collectionView.register(UINib(nibName: String(describing: CharacterCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CharacterCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CharacterViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.searchCharacters(text: searchController.searchBar.text)
    }
}

extension CharacterViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CharacterCollectionViewCell.self), for: indexPath) as! CharacterCollectionViewCell
        let viewModel = viewModel.itemFor(row: indexPath.item)
        cell.configureView(viewModel: viewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeItem(collectionView: self.collectionView, collectionViewLayout: collectionViewLayout)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(row: indexPath.row)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        viewModel.collectionViewDidScroll(scrollView: scrollView)
    }
}

extension CharacterViewController: CharacterViewModelViewDelegate {
    func updateScreen() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
