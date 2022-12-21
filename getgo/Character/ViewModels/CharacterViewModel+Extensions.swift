//
//  CharacterViewModel+Extensions.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit
import AppsCore

extension CharacterViewModel: CharacterViewModelType {

    var title: String {
        "character".capitalized
    }

    func barItem() -> UIBarButtonItem {
        let barItem = UIBarButtonItem(image: UIImage(named: "Slider"), style: .plain, target: self, action: #selector(filterButtonPressed))
        return barItem
    }

    func numberOfItems() -> Int {
        characters.count
    }

    func itemFor(row: Int) -> CharacterCollectionViewCellViewModel {
        CharacterCollectionViewCellViewModel(character: characters[row])
    }

    func sizeItem(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowLayout?.minimumInteritemSpacing ?? 0) + 10
        let width: CGFloat = (collectionView.frame.size.width - space) * 0.5
        return CGSize(width: width, height: width * (3 / 2))
    }

    // Event

    func getCharacters() {
        api.fetchCharacters(filter: filter) { [weak self] data, error in
            guard let self = self else { return }
            let results = data?.results ?? []
            if let firstData = results.first {
                if !self.characters.contains(where: { $0.id == firstData.id }) {
                    self.characters += results
                } else {
                    self.characters = results
                }
            }
            self.filter.page += 1
            self.viewDelegate?.updateScreen()
        }
    }

    func searchCharacters(text: String?) {
        filter.name = text
        filter.page = 1
        characters.removeAll()
        getCharacters()
    }

    func didSelectItem(id: Int) {
        // go to detail
    }

    func collectionViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height {
            if isPagination {
                getCharacters()
            } else {
                if lastPage > 1 {
                    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
                        scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height - scrollView.frame.size.height), animated: false)
                    }
                }
            }
        }
    }

    @objc private func filterButtonPressed() {

    }

}
