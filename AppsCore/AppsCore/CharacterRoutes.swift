//
//  CharacterRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public enum CharacterRoutes {

    case getCharacters(filter: FilterCharacter)
    case getCharacter(id: Int)

    public var path: String {
        switch self {
        case .getCharacter(let id):
            return String(format: "character/%i", id)
        default: return ""
        }
    }

    public var url: URL {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com/api/character")!
        switch self {
        case .getCharacters(let filter):
            let name = filter.name ?? ""
            let status = filter.status?.rawValue ?? ""
            let species = filter.species?.rawValue ?? ""
            let gender = filter.gender?.rawValue ?? ""
            urlComponents.queryItems = [
                URLQueryItem(name: "page", value: String(filter.page)),
                URLQueryItem(name: "name", value: name),
                URLQueryItem(name: "status", value: status),
                URLQueryItem(name: "species", value: species),
                URLQueryItem(name: "gender", value: gender)
            ]
        default: break
        }
        return urlComponents.url!
    }
}
