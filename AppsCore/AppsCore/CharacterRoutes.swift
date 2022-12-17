//
//  CharacterRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public enum CharacterRoutes {

    case getCharacters(page: Int, name: String, status: String, species: String, gender: String)
    case getCharacterDetail(id: Int)

    public var path: String {
        switch self {
        case .getCharacters(let page, let name, let status, let species, let gender):
            return String(format: "character?page=%i&name=%@&status=%@&species=%@&gender=%@", page, name, status, species, gender)
        case .getCharacterDetail(let id):
            return String(format: "character/%i", id)
        }
    }

    public var url: URL {
        let baseUrl = URL(string: "https://rickandmortyapi.com/api/")!
        return baseUrl.appendingPathComponent(path)
    }
}
