//
//  ProductService.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import RxSwift
protocol ProductServiceProtocol {
    func fetchProducts() -> Observable<[Product]>
}
class ProductService: ProductServiceProtocol {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchProducts() -> Observable<[Product]> {
        let request = APIRouter.getProducts
        return apiClient.request(request)
            .map { (response: ProductResponse) in
                return response.products
            }
    }
}

 
