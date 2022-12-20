//
//  ViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 17/12/22.
//

import UIKit
import AppsCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = EpisodeApi(network: NetworkManager())
        api.fetchEpisodes(page: 1, name: nil) { data, error in
            print(data?.results.first?.name)
        }
    }


}

