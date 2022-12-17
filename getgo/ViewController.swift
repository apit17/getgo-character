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
        let api = CharacterApi(network: NetworkManager())
        let filter = FilterCharacter(page: 1)
        api.fetchCharacters(filter: filter) { data, error in
//            print(data)
//            print(error?.localizedDescription)
        }
    }


}

