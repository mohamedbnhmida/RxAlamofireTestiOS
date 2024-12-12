//
//  ProductListCoordinator.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import UIKit
import Resolver

class ProductListCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewModel = Resolver.resolve(ProductListViewModel.self)
        let viewController = ProductListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
