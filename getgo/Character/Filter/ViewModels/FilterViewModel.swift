//
//  FilterViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import Foundation
import AppsCore

protocol FilterViewModelType {
    var filters: [FilterModel] { get }
    var panCorner: CGFloat { get }
    var contentCorner: CGFloat { get }
    var buttonCorner: CGFloat { get }

    func numberOfItems() -> Int
    func itemFor(row: Int) -> FilterTableViewCellViewModel
    func update(type: FilterType, filters: [FilterData])
}

class FilterViewModel: FilterViewModelType {
    var filters: [FilterModel] = []

    var panCorner: CGFloat {
        10
    }

    var contentCorner: CGFloat {
        4
    }

    var buttonCorner: CGFloat {
        10
    }

    convenience init(filters: [FilterModel]) {
        self.init()
        self.filters = filters
    }

    func numberOfItems() -> Int {
        return filters.count
    }

    func itemFor(row: Int) -> FilterTableViewCellViewModel {
        FilterTableViewCellViewModel(filter: filters[row])
    }

    func update(type: FilterType, filters: [FilterData]) {
        for (i, filter) in self.filters.enumerated() {
            if type == filter.type {
                self.filters[i].filters = filters
            }
        }
    }
}
