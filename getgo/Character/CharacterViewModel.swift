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

    func numberOfItems() -> Int
    func itemFor(row: Int) -> CharacterCollectionViewCellViewModel
    func sizeItem(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout) -> CGSize

    // Event
    func getCharacters()
}

protocol CharacterViewModelViewDelegate: AnyObject {
    func updateScreen()
}

class CharacterViewModel {

    weak var viewDelegate: CharacterViewModelViewDelegate?
    var navigation: UINavigationController?

    var filter = FilterCharacter(page: 1)
    private var characters: [Character] = []
    private var api: CharacterApiProtocol = CharacterApi(network: NetworkManager())

    convenience init(api: CharacterApiProtocol) {
        self.init()
        self.api = api
    }
}

extension CharacterViewModel: CharacterViewModelType {

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

    func getCharacters() {
        api.fetchCharacters(filter: filter) { [weak self] data, error in
            self?.characters = data?.results ?? []
            self?.viewDelegate?.updateScreen()
        }
    }
}
