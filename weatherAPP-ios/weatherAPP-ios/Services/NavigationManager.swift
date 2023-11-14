//
//  NavigationManager.swift
//  weatherAPP-ios
//
//  Created by renaud on 14/11/2023.
//

import Foundation
import UIKit

class NavigationManager: NSObject {

    static let shared = NavigationManager()

    // swiftlint:disable implicitly_unwrapped_optional
    var mainViewController: UINavigationController!

    // MARK: - Lifecycle

    override private init() {
        super.init()
        mainViewController = UINavigationController()
    }

    // MARK: - NavigationManager

    func setViewController(overHome viewController: UIViewController?, animated: Bool) {
    }

    func getCurrentViewController() -> UIViewController? {
        return mainViewController
    }

    func popToRootViewController(animated: Bool) {
        mainViewController.popToRootViewController(animated: animated)
    }

    func popToRootViewControllerAndPush(viewControllers: [UIViewController] = [], animated: Bool) {
        mainViewController.popToRootViewController(animated: false)
        for viewController in viewControllers {
            mainViewController.pushViewController(viewController, animated: animated)
        }
    }

    func popToRootViewControllerAndPresent(viewController: UIViewController, animated: Bool) {
        mainViewController.popToRootViewController(animated: animated)
        mainViewController.present(viewController, animated: animated)
    }

    func popTo(viewController: UIViewController?, animated: Bool) {
        guard let viewController = viewController else { return }
        mainViewController.popToViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) {
        mainViewController.popViewController(animated: animated)
    }

    func push(viewController: UIViewController?, animated: Bool) {
        guard let viewController = viewController else { return }
        mainViewController.pushViewController(viewController, animated: animated)
    }

    func present(viewController: UIViewController?, animated: Bool) {
        guard let viewController = viewController else { return }
        mainViewController.present(viewController, animated: animated)
    }
}
