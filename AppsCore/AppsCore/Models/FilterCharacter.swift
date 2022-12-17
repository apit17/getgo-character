//
//  FilterCharacter.swift
//  AppsCore
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import Foundation

public struct FilterCharacter {
    public let page: Int
    public var name: String?
    public var status: Status?
    public var species: Species?
    public var gender: Gender?
}

public enum Status: String {
    case alive, dead, unknown

    public var display: String {
        return self.rawValue.capitalized
    }
}

public enum Species: String {
    case alien, animal, human, myth

    public var display: String {
        switch self {
        case .myth:
            return "Mythological Creature"
        default:
            return self.rawValue.capitalized
        }
    }
}

public enum Gender: String {
    case male, female, genderless, unknown

    public var display: String {
        return self.rawValue.capitalized
    }
}
