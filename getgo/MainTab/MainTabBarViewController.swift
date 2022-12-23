//
//  MainTabBarViewController.swift
//  getgo
//
//  Created by Apit Gilang Aprida on 21/12/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let characterController = CharacterViewController()
        let characterTabItem = UITabBarItem(title: "Character", image: UIImage(named: "Octocat"), selectedImage: UIImage(named: "Octocat-1"))
        characterController.tabBarItem = characterTabItem

        let characterNavigation = UINavigationController(rootViewController: characterController)
        let characterViewModel = CharacterViewModel()
        characterViewModel.navigation = characterNavigation
        characterController.viewModel = characterViewModel

        let locationController = LocationViewController()
        let locationTabItem = UITabBarItem(title: "Location", image: UIImage(named: "Place Marker"), selectedImage: UIImage(named: "Place Marker-1"))
        locationController.tabBarItem = locationTabItem

        let locationNavigation = UINavigationController(rootViewController: locationController)
        let locationViewModel = LocationViewModel()
        locationViewModel.navigation = locationNavigation
        locationController.viewModel = locationViewModel

        let episodeController = EpisodeViewController()
        let episodeTabItem = UITabBarItem(title: "Episodes", image: UIImage(named: "TV Show"), selectedImage: UIImage(named: "TV Show-1"))
        episodeController.tabBarItem = episodeTabItem

        let episodeNavigation = UINavigationController(rootViewController: episodeController)
        let episodeViewModel = EpisodeViewModel()
        episodeViewModel.navigation = episodeNavigation
        episodeController.viewModel = episodeViewModel

        setViewControllers([characterNavigation, locationNavigation, episodeNavigation], animated: false)
    }

}
