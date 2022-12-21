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

    func barItem() -> UIBarButtonItem
    func numberOfItems() -> Int
    func itemFor(row: Int) -> CharacterCollectionViewCellViewModel
    func sizeItem(collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout) -> CGSize

    // Event
    func getCharacters()
    func searchCharacters(text: String?)
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
    var characters: [Character] = []
    var api: CharacterApiProtocol = CharacterApi(network: NetworkManager())
    var isPagination = true
    let lastPage = 10

    convenience init(api: CharacterApiProtocol) {
        self.init()
        self.api = api
    }
}
