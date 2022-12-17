//
//  LocationRoutes.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 18/12/22.
//

import Foundation

public enum LocationRoutes {

    case getLocations(page: Int, name: String?)
    case getLocation(id: Int)

    public var path: String {
        let basePath = "/api/location"
        switch self {
        case .getLocation(let id):
            return String(format: "%@/%i", basePath, id)
        default:
            return basePath
        }
    }

    public var url: URL {
        var urlComponents = URLComponents(string: "https://rickandmortyapi.com")!
        switch self {
        case .getLocations(let page, let name):
            urlComponents.queryItems = [
                URLQueryItem(name: "page", value: String(page)),
                URLQueryItem(name: "name", value: name)
            ]
            urlComponents.path = path
        case .getLocation:
            urlComponents.path = path
        }
        return urlComponents.url!
    }
}
