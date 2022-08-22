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

    private lazy var requestManager = RequestManager()
    private let country = "us"
    private let bundleName = "Main"
    private lazy var viewModel = TopHeadlinesViewModel(requestManager: requestManager,
                                                       country: country)

    private func makeTopHeadlinesViewController() -> TopHeadlinesViewController {
        let bundle = Bundle(for: TopHeadlinesViewController.self)
        let storyboard = UIStoryboard(name: self.bundleName, bundle: bundle)
        let viewController = storyboard.instantiateInitialViewController() as! TopHeadlinesViewController
        viewController.viewModel = viewModel
        viewController.select = { [self] headlineURLString in
            let vc = self.makeHeadlineDetailsViewController(headlineURLString: headlineURLString)
            navigationController.show(vc, sender: nil)
        }
        return viewController
    }

    private func makeHeadlineDetailsViewController(headlineURLString: String) -> HeadlineDetailsViewController {
        let bundle = Bundle(for: HeadlineDetailsViewController.self)
        let storyboard = UIStoryboard(name: self.bundleName, bundle: bundle)
        let viewController = storyboard.instantiateViewController(
            identifier: HeadlineDetailsViewController.reuseIdentifier
        ) { coder -> HeadlineDetailsViewController? in
            HeadlineDetailsViewController(coder: coder, urlString: headlineURLString)
        }

        return viewController
    }
}
