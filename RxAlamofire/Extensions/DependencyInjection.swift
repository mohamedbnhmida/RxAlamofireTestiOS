//
//  DependencyInjection.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { APIClient() }
        register { ProductService(apiClient: resolve()) as ProductServiceProtocol }
        register { ProductListViewModel(productService: resolve()) }
    }
}
 
