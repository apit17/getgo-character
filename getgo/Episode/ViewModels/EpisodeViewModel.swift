//
//  EpisodeViewModel.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 23/12/22.
//

import UIKit
import AppsCore

protocol EpisodeViewModelType {

    var viewDelegate: EpisodeViewModelViewDelegate? { get set }
    var title: String { get }

    func numberOfItems() -> Int
    func itemFor(row: Int) -> EpisodeTableViewCellViewModel

    // Event
    func getEpisodes()
    func searchLocations(text: String?)
    func didSelectItem(id: Int)
    func tableViewDidScroll(scrollView: UIScrollView)
}

protocol EpisodeViewModelViewDelegate: AnyObject {
    func updateScreen()
}

class EpisodeViewModel {

    weak var viewDelegate: EpisodeViewModelViewDelegate?
    var navigation: UINavigationController?

    var episodes: [Episode] = []
    var api: EpisodeApiProtocol = EpisodeApi(network: NetworkManager())
    var isPagination = true
    var currentPage = 1
    var search: String?
    let lastPage = 10

    convenience init(api: EpisodeApiProtocol) {
        self.init()
        self.api = api
    }
}

extension EpisodeViewModel: EpisodeViewModelType {
    var title: String {
        "character".capitalized
    }

    func numberOfItems() -> Int {
        episodes.count
    }

    func itemFor(row: Int) -> EpisodeTableViewCellViewModel {
        EpisodeTableViewCellViewModel(episode: episodes[row])
    }

    func getEpisodes() {
        api.fetchEpisodes(page: currentPage, name: search) { [weak self] data, error in
            guard let self = self else { return }
            let results = data?.results ?? []
            if let firstData = results.first {
                if !self.episodes.contains(where: { $0.id == firstData.id }) {
                    self.episodes += results
                } else {
                    self.episodes = results
                }
            }
            self.currentPage += 1
            self.viewDelegate?.updateScreen()
        }
    }

    func searchLocations(text: String?) {
        currentPage = 1
        episodes.removeAll()
        search = text
        getEpisodes()
    }

    func didSelectItem(id: Int) {
        //
    }

    func tableViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height {
            if isPagination {
                getEpisodes()
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
