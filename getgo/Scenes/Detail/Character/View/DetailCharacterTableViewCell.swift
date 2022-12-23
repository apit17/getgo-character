//
//  DetailCharacterTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit

class DetailCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configureView(viewModel: DetailCharacterViewModel) {
        viewModel.setImage(imageView: characterImage)
        nameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
        statusImage.image = viewModel.statusImage
        genderLabel.text = viewModel.gender
        genderImage.image = viewModel.genderImage
        speciesLabel.text = viewModel.species
        dateLabel.text = viewModel.created
        originLabel.text = viewModel.origin
        locationLabel.text = viewModel.location
        episodeLabel.text = viewModel.episode
    }
}

extension DetailCharacterTableViewCell: DetailModelProtocol {
    func populateCell(viewModel: DetailCellProtocol) {
        if let viewModel = viewModel as? DetailCharacterViewModel {
            self.configureView(viewModel: viewModel)
        }
    }
}
