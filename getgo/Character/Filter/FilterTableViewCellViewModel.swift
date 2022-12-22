//
//  FilterTableViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import Foundation
import AppsCore

protocol FilterTableViewCellViewDelegate: AnyObject {
    func updateScreen()
}

class FilterTableViewCellViewModel {

    weak var delegate: FilterTableViewCellViewDelegate?
    var filters: [FilterData] = []
    private let filter: FilterModel

    init(filter: FilterModel) {
        self.filter = filter
        filters = filter.filters
    }
}

extension FilterTableViewCellViewModel {
    var title: String {
        filter.type.displayName
    }

    var type: FilterType {
        filter.type
    }

    func collectionViewHeight(collectionWidth: CGFloat) -> CGFloat {
        let names = filters.map { $0.name }
        let widths = names.map { ($0 as NSString).size().width + 40 }
        let totalWidths = widths.reduce(0, +)
        if totalWidths > collectionWidth {
            return 74
        } else {
            return 32
        }
    }

    func numberOfItems() -> Int {
        filters.count
    }

    func itemFor(row: Int) -> FilterCollectionViewCellViewModel {
        FilterCollectionViewCellViewModel(filter: filters[row])
    }

    func didSelectItem(row: Int) {
        filters.forEach { $0.selected = false }
        filters[row].selected = filters[row].selected ? false : !filters[row].selected
        delegate?.updateScreen()
    }
}
