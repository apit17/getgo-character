//
//  CharacterRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public enum CharacterRoutes {

    case getCharacters(page: Int)
    case getCharacterDetail(id: Int)

    var path: String {
        switch self {
        case .getCharacters(let page):
            return String(format: "character?page=%i", page)
        case .getCharacterDetail(let id):
            return String(format: "character/%i", id)
        }
    }

    public var url: URL {
        let baseUrl = URL(string: "https://rickandmortyapi.com/api/")!
        return baseUrl.appendingPathComponent(path)
    }
}
