//
//  DetailViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let characterIdentifier = String(describing: DetailCharacterTableViewCell.self)
    private let locationIdentifier = String(describing: DetailLocationTableViewCell.self)
    private let episodeIdentifier = String(describing: DetailEpisodeTableViewCell.self)

    var viewModel: DetailViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: characterIdentifier, bundle: nil), forCellReuseIdentifier: characterIdentifier)
        tableView.register(UINib(nibName: locationIdentifier, bundle: nil), forCellReuseIdentifier: locationIdentifier)
        tableView.register(UINib(nibName: episodeIdentifier, bundle: nil), forCellReuseIdentifier: episodeIdentifier)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel.fetchDetail()
    }

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.identifier, for: indexPath) as! DetailModelProtocol
        cell.populateCell(viewModel: viewModel.details)
        return (cell as? UITableViewCell) ?? UITableViewCell()
    }
}

extension DetailViewController: DetailViewModelViewDelegate {
    func updateScreen() {
        DispatchQueue.main.async {
            self.title = self.viewModel.title
            self.tableView.reloadData()
        }
    }
}
