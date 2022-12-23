//
//  DetailCharacterViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit
import AppsCore

class DetailCharacterViewModel: DetailCellProtocol {

    var cellIdentifier: String {
        String(describing: DetailCharacterTableViewCell.self)
    }
    var detail: Character?
    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchDetail(completion: @escaping () -> Void) {
        let api = CharacterApi(network: NetworkManager())
        api.fetchCharacter(id: id) { [weak self] data, error in
            self?.detail = data
            completion()
        }
    }
}

extension DetailCharacterViewModel {
    var title: String {
        detail?.name ?? "-"
    }

    var name: String {
        title
    }

    var status: String {
        detail?.status ?? "-"
    }

    var gender: String {
        detail?.gender ?? "-"
    }

    var species: String {
        detail?.species ?? "-"
    }

    var created: String {
        detail?.created ?? "-"
    }

    var origin: String {
        detail?.origin.name ?? "-"
    }

    var location: String {
        detail?.location.name ?? "-"
    }

    var episode: String {
        detail?.episode.joined(separator: "\n") ?? "-"
    }

    var statusImage: UIImage {
        let status = Status(rawValue: status.lowercased())
        return UIImage(named: status?.rawValue ?? "") ?? UIImage()
    }

    var genderImage: UIImage {
        let status = Gender(rawValue: gender.lowercased())
        return UIImage(named: status?.rawValue ?? "") ?? UIImage()
    }

    func setImage(imageView: UIImageView) {
        imageView.setImage(withUrlString: detail?.image)
    }
}
