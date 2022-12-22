//
//  FilterModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import Foundation

struct FilterModel {
    var type: FilterType
    var filters: [FilterData] = []

    static let types: [FilterModel] = [
        FilterModel(type: .status, filters: FilterType.status.filters),
        FilterModel(type: .species, filters: FilterType.species.filters),
        FilterModel(type: .gender, filters: FilterType.gender.filters)
    ]

}
