//
//  FilterType.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import AppsCore

enum FilterType: Int {
    case status, species, gender

    var displayName: String {
        switch self {
        case .status:
            return "Status"
        case .gender:
            return "Gender"
        case .species:
            return "Species"
        }
    }

    var filters: [FilterData] {
        switch self {
        case .status:
            let status: [Status] = [.alive, .dead, .unknown]
            return status.map { FilterData(name: $0.display, selected: false) }
        case .species:
            let species: [Species] = [.alien, .animal, .myth, .human]
            return species.map { FilterData(name: $0.display, selected: false) }
        case .gender:
            let gender: [Gender] = [.male, .female, .genderless, .unknown]
            return gender.map { FilterData(name: $0.display, selected: false) }
        }
    }
}
