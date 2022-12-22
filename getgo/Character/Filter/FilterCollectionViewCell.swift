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

    func configureView(name: String) {
        nameLabel.text = name
        filterView.layer.borderColor = UIColor.lightGray.cgColor
        filterView.layer.borderWidth = 1
        filterView.layer.cornerRadius = 10
    }
}
