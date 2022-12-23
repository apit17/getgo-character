//
//  DetailLocationTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit

class DetailLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var residentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func configureView(viewModel: DetailLocationViewModel) {
        nameLabel.text = viewModel.name
        typeLabel.text = viewModel.type
        dimensionLabel.text = viewModel.dimension
        dateLabel.text = viewModel.created
        residentLabel.text = viewModel.resident
    }
    
}

extension DetailLocationTableViewCell: DetailModelProtocol {
    func populateCell(viewModel: DetailCellProtocol) {
        if let viewModel = viewModel as? DetailLocationViewModel {
            configureView(viewModel: viewModel)
        }
    }
}
