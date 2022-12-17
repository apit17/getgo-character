//
//  Character.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public struct Character: Codable {
    public let id: Int
    public let name: String
    public let species: String
    public let image: String
    public let gender: String
    public let status: String
    public let created: String
    public let origin: Origin
    public let location: CharacterLocation
    public let episode: [String]
}

public struct Origin: Codable {
    public let name: String
}

public struct CharacterLocation: Codable {
    public let name: String
}
