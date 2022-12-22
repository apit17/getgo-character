//
//  FilterViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import Foundation
import AppsCore

protocol FilterViewModelType {
    var filterTypes: [FilterType] { get }
    var panCorner: CGFloat { get }
    var contentCorner: CGFloat { get }
    var buttonCorner: CGFloat { get }

    func numberOfItems() -> Int
    func itemFor(row: Int) -> FilterTableViewCellViewModel
}

class FilterViewModel: FilterViewModelType {
    var filterTypes: [FilterType] {
        [.status, .species, .gender]
    }

    var panCorner: CGFloat {
        10
    }

    var contentCorner: CGFloat {
        4
    }

    var buttonCorner: CGFloat {
        10
    }

    func numberOfItems() -> Int {
        return filterTypes.count
    }

    func itemFor(row: Int) -> FilterTableViewCellViewModel {
        FilterTableViewCellViewModel(type: FilterType(rawValue: row) ?? .status)
    }
}

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
}
