//
//  FilterCollectionViewCellViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit

class FilterCollectionViewCellViewModel {

    private let filter: FilterData

    init(filter: FilterData) {
        self.filter = filter
    }
}

extension FilterCollectionViewCellViewModel {
    var name: String {
        filter.name
    }

    var borderColor: UIColor {
        filter.selected ? UIColor.systemBlue : UIColor.lightGray
    }

    var borderWidth: CGFloat {
        1
    }

    var viewCorner: CGFloat {
        10
    }
}
