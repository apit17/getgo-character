//
//  CharacterCollectionViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit
import AppsCore

class CharacterCollectionViewCellViewModel {

    private let character: Character

    init(character: Character) {
        self.character = character
    }
}

extension CharacterCollectionViewCellViewModel {

    var name: String {
        character.name
    }

    var species: String {
        character.species
    }

    var cornerRadius: CGFloat {
        12
    }

    func setImage(imageView: UIImageView) {
        imageView.setImage(withUrlString: character.image)
    }
}
