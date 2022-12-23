//
//  LocationTableViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import AppsCore

class LocationTableViewCellViewModel {

    private let location: Location

    init(location: Location) {
        self.location = location
    }
}

extension LocationTableViewCellViewModel {
    var id: Int {
        location.id
    }

    var name: String {
        location.name
    }

    var type: String {
        location.type
    }

    var dimension: String {
        String(format: "Dimension:\n%@", location.dimension)
    }
}
