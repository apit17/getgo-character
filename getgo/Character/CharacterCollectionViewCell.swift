//
//  CharacterCollectionViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var characterView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    func configureView(viewModel: CharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.name
        speciesLabel.text = viewModel.species
        viewModel.setImage(imageView: backgroundImage)
        characterView.layer.cornerRadius = viewModel.cornerRadius
    }

}
