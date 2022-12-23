//
//  LocationViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 22/12/22.
//

import UIKit
import AppsCore

protocol LocationViewModelType {

    var viewDelegate: LocationViewModelViewDelegate? { get set }
    var title: String { get }

    func numberOfItems() -> Int
    func itemFor(row: Int) -> LocationTableViewCellViewModel

    // Event
    func getLocations()
    func searchLocations(text: String?)
    func didSelectItem(row: Int)
    func tableViewDidScroll(scrollView: UIScrollView)
}

protocol LocationViewModelViewDelegate: AnyObject {
    func updateScreen()
}

class LocationViewModel {

    weak var viewDelegate: LocationViewModelViewDelegate?
    var navigation: UINavigationController?

    var locations: [Location] = []
    var api: LocationApiProtocol = LocationApi(network: NetworkManager())
    var isPagination = true
    var currentPage = 1
    var search: String?
    let lastPage = 10

    convenience init(api: LocationApiProtocol) {
        self.init()
        self.api = api
    }
}

extension LocationViewModel: LocationViewModelType {
    var title: String {
        "character".capitalized
    }

    func numberOfItems() -> Int {
        locations.count
    }

    func itemFor(row: Int) -> LocationTableViewCellViewModel {
        LocationTableViewCellViewModel(location: locations[row])
    }

    func getLocations() {
        api.fetchLocations(page: currentPage, name: search) { [weak self] data, error in
            guard let self = self else { return }
            let results = data?.results ?? []
            if let firstData = results.first {
                if !self.locations.contains(where: { $0.id == firstData.id }) {
                    self.locations += results
                } else {
                    self.locations = results
                }
            }
            self.currentPage += 1
            self.viewDelegate?.updateScreen()
        }
    }

    func searchLocations(text: String?) {
        currentPage = 1
        locations.removeAll()
        search = text
        getLocations()
    }

    func didSelectItem(row: Int) {
        let id = itemFor(row: row).id
        let viewModel = DetailViewModel(detail: DetailLocationViewModel(id: id))
        let detailController = DetailViewController()
        detailController.viewModel = viewModel
        let detailNavigation = UINavigationController(rootViewController: detailController)
        navigation?.present(detailNavigation, animated: true)
    }

    func tableViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height {
            if isPagination {
                getLocations()
            } else {
                if lastPage > 1 {
                    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
                        scrollView.setContentOffset(CGPointMake(scrollView.contentOffset.x, scrollView.contentSize.height - scrollView.frame.size.height), animated: false)
                    }
                }
            }
        }
    }
    
}
