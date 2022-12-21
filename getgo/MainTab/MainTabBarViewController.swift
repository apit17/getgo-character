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

        setViewControllers([characterNavigation], animated: false)
    }

}
