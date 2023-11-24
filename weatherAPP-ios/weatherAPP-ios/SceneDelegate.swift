//
//  SceneDelegate.swift
//  weatherAPP-ios
//
//  Created by renaud on 13/11/2023.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: HomePageCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        guard let navigationManager = DependencyProvider.shared.navigationManager().mainViewController else { return }

        let coordinator = HomePageCoordinator(navigationController: navigationManager)
        self.coordinator = coordinator
        self.window?.rootViewController = navigationManager
        coordinator.start()
        window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
