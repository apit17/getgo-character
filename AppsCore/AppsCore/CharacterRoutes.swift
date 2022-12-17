//
//  CharacterRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public enum CharacterRoutes {

    case getCharacters(filter: FilterCharacter)
    case getCharacterDetail(id: Int)

    public var path: String {
        switch self {
        case .getCharacters(let filter):
            let name = filter.name ?? ""
            let status = filter.status?.rawValue ?? ""
            let species = filter.species?.rawValue ?? ""
            let gender = filter.gender?.rawValue ?? ""
            return String(format: "character?page=%i&name=%@&status=%@&species=%@&gender=%@", filter.page, name, status, species, gender)
        case .getCharacterDetail(let id):
            return String(format: "character/%i", id)
        }
    }

    public var url: URL {
        let baseUrl = URL(string: "https://rickandmortyapi.com/api/")!
        return baseUrl.appendingPathComponent(path)
    }
}
