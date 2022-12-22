//
//  FilterTableViewCell.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    private var viewModel: FilterTableViewCellViewModel!

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
        cell.configureView(name: viewModel.itemFor(row: indexPath.row))
        return cell
    }
}
