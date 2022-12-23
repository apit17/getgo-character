//
//  DetailEpisodeViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import AppsCore

class DetailEpisodeViewModel: DetailCellProtocol {

    var cellIdentifier: String {
        String(describing: DetailEpisodeTableViewCell.self)
    }

    var detail: Episode?
    private let id: Int

    init(id: Int) {
        self.id = id
    }

    func fetchDetail(completion: @escaping () -> Void) {
        let api = EpisodeApi(network: NetworkManager())
        api.fetchEpisode(id: id) { [weak self] data, error in
            self?.detail = data
            completion()
        }
    }
}

extension DetailEpisodeViewModel {
    var title: String {
        detail?.name ?? "-"
    }

    var name: String {
        title
    }

    var airDate: String {
        String(format: "Air Date: %@", (detail?.airDate ?? "-"))
    }

    var episode: String {
        let episodeJoin = detail?.episode.components(separatedBy: "E") ?? []
        let season = episodeJoin.first?.replacingOccurrences(of: "S", with: "")
        let seasonInt = Int(season ?? "0") ?? 0
        let episode = episodeJoin.last
        let episodeInt = Int(episode ?? "0") ?? 0
        return String(format: "Season: %i\nEpisode: %i", seasonInt, episodeInt)
    }

    var created: String {
        detail?.created ?? "-"
    }

    var character: String {
        detail?.characters.joined(separator: "\n") ?? "-"
    }
}
