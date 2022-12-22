//
//  FilterCollectionViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var nameLabel: UILabel!

    func configureView(viewModel: FilterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.name
        nameLabel.textColor = viewModel.borderColor
        filterView.layer.borderColor = viewModel.borderColor.cgColor
        filterView.layer.borderWidth = viewModel.borderWidth
        filterView.layer.cornerRadius = viewModel.viewCorner
    }
}
