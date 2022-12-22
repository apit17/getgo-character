//
//  FilterTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit

protocol FilterTableViewCellDelegate: AnyObject {
    func updateFilter(type: FilterType, filters: [FilterData])
}

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!

    weak var delegate: FilterTableViewCellDelegate?
    private var viewModel: FilterTableViewCellViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        collectionView.register(UINib(nibName: String(describing: FilterCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: FilterCollectionViewCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = FlowLayout(minimumInteritemSpacing: 8, minimumLineSpacing: 8)
    }

    func configureView(viewModel: FilterTableViewCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        collectionView.reloadData()
        collectionViewHeight.constant = viewModel.collectionViewHeight(collectionWidth: collectionView.frame.width)
    }
    
}

extension FilterTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FilterCollectionViewCell.self), for: indexPath) as! FilterCollectionViewCell
        cell.configureView(viewModel: viewModel.itemFor(row: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem(row: indexPath.row)
    }
}

extension FilterTableViewCell: FilterTableViewCellViewDelegate {
    func updateScreen() {
        collectionView.reloadData()
        delegate?.updateFilter(type: viewModel.type, filters: viewModel.filters)
    }
}
