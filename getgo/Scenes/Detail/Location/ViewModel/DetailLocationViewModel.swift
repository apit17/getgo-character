//
//  DetailLocationViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import AppsCore

class DetailLocationViewModel: DetailCellProtocol {

    var cellIdentifier: String {
        String(describing: DetailLocationTableViewCell.self)
    }

    var detail: Location?
    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchDetail(completion: @escaping () -> Void) {
        let api = LocationApi(network: NetworkManager())
        api.fetchLocation(id: id) { [weak self] data, error in
            self?.detail = data
            completion()
        }
    }
}

extension DetailLocationViewModel {
    var title: String {
        detail?.name ?? "-"
    }

    var name: String {
        title
    }

    var type: String {
        String(format: "Type: %@", (detail?.type ?? "-"))
    }

    var dimension: String {
        String(format: "Dimension:\n%@", (detail?.dimension ?? "-"))
    }

    var created: String {
        detail?.created ?? "-"
    }

    var resident: String {
        detail?.residents.joined(separator: "\n") ?? "-"
    }
}
