//
//  EpisodeRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public enum EpisodeRoutes {

    case getEpisodes(page: Int, name: String?)
    case getEpisode(id: Int)

    public var path: String {
        let basePath = "/api/episode"
        switch self {
        case .getEpisode(let id):
            return String(format: "%@/%i", basePath, id)
        default:
            return basePath
        }
    }

    public var url: URL {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com")!
        switch self {
        case .getEpisodes(let page, let name):
            urlComponents.queryItems = [
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "name", value: name)
            ]
            urlComponents.path = path
        case .getEpisode:
            urlComponents.path = path
        }
        return urlComponents.url!
    }
}
