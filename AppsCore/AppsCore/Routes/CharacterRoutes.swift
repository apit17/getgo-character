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
        let basePath = "/api/character"
        switch self {
        case .getCharacter(let id):
            return String(format: "%@/%i", basePath, id)
        default:
            return basePath
        }
    }

    public var url: URL {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com")!
        switch self {
        case .getCharacters(let filter):
            let name = filter.name ?? ""
            let status = filter.status ?? ""
            let species = filter.species ?? ""
            let gender = filter.gender ?? ""
            urlComponents.queryItems = [
                URLQueryItem(name: "page", value: String(filter.page)),
                URLQueryItem(name: "name", value: name),
                URLQueryItem(name: "status", value: status),
                URLQueryItem(name: "species", value: species),
                URLQueryItem(name: "gender", value: gender)
            ]
            urlComponents.path = path
        case .getCharacter:
            urlComponents.path = path
        }
        return urlComponents.url!
    }
}
