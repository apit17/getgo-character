//
//  CharacterViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 19/12/22.
//

import Foundation
import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        title = "character".capitalized
    }
}
