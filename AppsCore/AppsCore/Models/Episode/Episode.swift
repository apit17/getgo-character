//
//  Episode.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public struct Episode: Codable {
    public let id: Int
    public let name: String
    public let airDate: String
    public let episode: String
    public let characters: [String]
    public let url: String
    public let created: String

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
}
