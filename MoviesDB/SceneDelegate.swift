//
//  SceneDelegate.swift
//  MoviesDB
//
//  Created by Peter Samir on 15/08/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene{
            let window = UIWindow(windowScene: windowScene)
            navigationController = UINavigationController(
                rootViewController: HomeViewController()
            )
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
