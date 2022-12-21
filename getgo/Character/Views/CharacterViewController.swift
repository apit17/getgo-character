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

    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        title = viewModel.title
    }

    private func setupCollectionView() {
        collectionView.register(UINib(nibName: String(describing: CharacterCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CharacterCollectionViewCell.self))
        collectionView.dataSource = self
        collectionView.delegate = self
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
        let id = viewModel.itemFor(row: indexPath.item).id
        viewModel.didSelectItem(id: id)
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
