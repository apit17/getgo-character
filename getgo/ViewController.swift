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
        let manager = AppsCore.Networking.Manager()
        let url = CharacterRoutes.getCharacters(page: 1).url

        manager.loadData(from: url) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }


}

