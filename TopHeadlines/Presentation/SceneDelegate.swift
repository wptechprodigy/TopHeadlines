//
//  SceneDelegate.swift
//  TopHeadlines
//
//  Created by waheedCodes on 19/08/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        configure(window)
    }

    // MARK: - Configure

    private lazy var navigationController = UINavigationController(
        rootViewController: makeTopHeadlinesViewController())

    private func configure(_ window: UIWindow?) {
        if let window = window {
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }

    private lazy var viewModel = TopHeadlinesViewModel()

    private func makeTopHeadlinesViewController() -> TopHeadlinesViewController {
        let bundle = Bundle(for: TopHeadlinesViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController() as! TopHeadlinesViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
