//
//  FilterTableViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import Foundation
import AppsCore

class FilterTableViewCellViewModel {

    private let type: FilterType

    init(type: FilterType) {
        self.type = type
    }
}

extension FilterTableViewCellViewModel {
    var title: String {
        type.displayName
    }

    var names: [String] {
        switch type {
        case .status:
            return status.map { $0.display }
        case .species:
            return species.map { $0.display }
        case .gender:
            return gender.map { $0.display }
        }
    }

    func collectionViewHeight(collectionWidth: CGFloat) -> CGFloat {
        let widths = names.map { ($0 as NSString).size().width + 40 }
        let totalWidths = widths.reduce(0, +)
        if totalWidths > collectionWidth {
            return 74
        } else {
            return 32
        }
    }

    func numberOfItems() -> Int {
        names.count
    }

    func itemFor(row: Int) -> String {
        names[row]
    }

    private var status: [Status] {
        [.alive, .dead, .unknown]
    }

    private var species: [Species] {
        [.alien, .animal, .myth, .human]
    }

    private var gender: [Gender] {
        [.male, .female, .genderless, .unknown]
    }
}
