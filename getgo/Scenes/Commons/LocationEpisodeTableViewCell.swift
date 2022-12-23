//
//  LocationEpisodeTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit

class LocationEpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var locationTypeLabel: UILabel!
    @IBOutlet weak var locationDimensionLabel: UILabel!
    @IBOutlet weak var episodeView: UIView!
    @IBOutlet weak var episodeNameLabel: UILabel!
    @IBOutlet weak var episodeInfoLabel: UILabel!
    @IBOutlet weak var episodeDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configureLocation(viewModel: LocationTableViewCellViewModel) {
        episodeView.isHidden = true
        locationView.layer.cornerRadius = 10
        locationView.layer.borderColor = UIColor.label.cgColor
        locationView.layer.borderWidth = 1
        locationNameLabel.text = viewModel.name
        locationTypeLabel.text = viewModel.type
        locationDimensionLabel.text = viewModel.dimension
    }

    func configureEpisode(viewModel: EpisodeTableViewCellViewModel) {
        locationView.isHidden = true
        episodeView.layer.cornerRadius = 10
        episodeView.layer.borderColor = UIColor.label.cgColor
        episodeView.layer.borderWidth = 1
        episodeNameLabel.text = viewModel.name
        episodeInfoLabel.text = viewModel.info
        episodeDateLabel.text = viewModel.date
    }
    
}
