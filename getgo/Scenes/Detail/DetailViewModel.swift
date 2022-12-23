//
//  DetailViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import Foundation

protocol DetailCellProtocol {
    var cellIdentifier: String { get }
    var title: String { get }
    func fetchDetail(completion: @escaping () -> Void)
}

protocol DetailModelProtocol {
    func populateCell(viewModel: DetailCellProtocol)
}

protocol DetailViewModelViewDelegate: AnyObject {
    func updateScreen()
}

class DetailViewModel {

    weak var delegate: DetailViewModelViewDelegate?
    private let detail: DetailCellProtocol

    init(detail: DetailCellProtocol) {
        self.detail = detail
    }

    var details: DetailCellProtocol {
        detail
    }
    var identifier: String {
        detail.cellIdentifier
    }
    var title: String {
        details.title
    }

    func fetchDetail() {
        detail.fetchDetail { [weak self] in
            self?.delegate?.updateScreen()
        }
    }
}
