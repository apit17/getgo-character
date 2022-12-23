//
//  FilterViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit

protocol FilterViewDelegate: AnyObject {
    func appliedFilter(filters: [FilterModel])
}

class FilterViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var panButton: UIButton!
    @IBOutlet weak var backgroundView: UIView!

    weak var delegate: FilterViewDelegate?
    var viewModel: FilterViewModelType!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
    }

    private func setupView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        backgroundView.addGestureRecognizer(tap)
        applyButton.addTarget(self, action: #selector(applyButtonPressed), for: .touchUpInside)
        panButton.layer.cornerRadius = viewModel.panCorner
        contentView.layer.cornerRadius = viewModel.contentCorner
        applyButton.layer.cornerRadius = viewModel.buttonCorner
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: String(describing: FilterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FilterTableViewCell.self))
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }

    @objc private func backgroundTapped() {
        dismiss(animated: true)
    }

    @objc private func applyButtonPressed() {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.appliedFilter(filters: self.viewModel.filters)
        }
    }

}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FilterTableViewCell.self), for: indexPath) as! FilterTableViewCell
        let viewModel = FilterTableViewCellViewModel(filter: viewModel.filters[indexPath.row])
        cell.configureView(viewModel: viewModel)
        cell.delegate = self
        return cell
    }
}

extension FilterViewController: FilterTableViewCellDelegate {
    func updateFilter(type: FilterType, filters: [FilterData]) {
        viewModel.update(type: type, filters: filters)
    }
}
