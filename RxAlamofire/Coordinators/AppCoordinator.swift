//
//  AppCoordinator.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import UIKit
import Resolver

class AppCoordinator {
    private let window: UIWindow
    private var productCoordinator: ProductListCoordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        productCoordinator = ProductListCoordinator(navigationController: navigationController)
        productCoordinator?.start()
    }
}
