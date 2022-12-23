//
//  DetailEpisodeTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit

class DetailEpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configureView(viewModel: DetailEpisodeViewModel) {
        nameLabel.text = viewModel.name
        airDateLabel.text = viewModel.airDate
        episodeLabel.text = viewModel.episode
        dateLabel.text = viewModel.created
        characterLabel.text = viewModel.character
    }
    
}

extension DetailEpisodeTableViewCell: DetailModelProtocol {
    func populateCell(viewModel: DetailCellProtocol) {
        if let viewModel = viewModel as? DetailEpisodeViewModel {
            configureView(viewModel: viewModel)
        }
    }
}
