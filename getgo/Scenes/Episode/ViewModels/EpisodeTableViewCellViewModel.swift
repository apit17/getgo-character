//
//  EpisodeTableViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import AppsCore

class EpisodeTableViewCellViewModel {

    private let episode: Episode

    init(episode: Episode) {
        self.episode = episode
    }
}

extension EpisodeTableViewCellViewModel {
    var id: Int {
        episode.id
    }

    var name: String {
        episode.name
    }

    var info: String {
        let episodeJoin = episode.episode.components(separatedBy: "E")
        let season = episodeJoin.first?.replacingOccurrences(of: "S", with: "")
        let seasonInt = Int(season ?? "0") ?? 0
        let episode = episodeJoin.last
        let episodeInt = Int(episode ?? "0") ?? 0
        return String(format: "season: %i\nepisode: %i", seasonInt, episodeInt)
    }

    var date: String {
        String(format: "Air Date:\n%@", episode.airDate)
    }
}
