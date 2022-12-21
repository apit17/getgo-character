//
//  CharacterViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit
import AppsCore

protocol CharacterViewModelType {

    var viewDelegate: CharacterViewModelViewDelegate? { get set }
    var title: String { get }

    func numberOfItems() -> Int
    func itemFor(row: Int) -> CharacterCollectionViewCellViewModel
    func sizeItem(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout) -> CGSize

    // Event
    func getCharacters()
    func didSelectItem(id: Int)
    func collectionViewDidScroll(scrollView: UIScrollView)
}

protocol CharacterViewModelViewDelegate: AnyObject {
    func updateScreen()
}

class CharacterViewModel {

    weak var viewDelegate: CharacterViewModelViewDelegate?
    var navigation: UINavigationController?

    var filter = FilterCharacter(page: 1) {
        didSet {
            isPagination = filter.page <= lastPage
        }
    }
    private var characters: [Character] = []
    private var api: CharacterApiProtocol = CharacterApi(network: NetworkManager())
    private var isPagination = true
    private let lastPage = 10

    convenience init(api: CharacterApiProtocol) {
        self.init()
        self.api = api
    }
}

extension CharacterViewModel: CharacterViewModelType {

    var title: String {
        "character".capitalized
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
            if let firstData = data?.results.first {
                if !self.characters.contains(where: { $0.id == firstData.id }) {
                    self.characters += data?.results ?? []
                }
            }
            self.filter.page += 1
            self.viewDelegate?.updateScreen()
        }
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
}
