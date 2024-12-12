//
//  ProductListViewModel.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//

import Foundation
import RxSwift
import RxCocoa

class ProductListViewModel {
    private let productService: ProductServiceProtocol
    private let disposeBag = DisposeBag()

    let products = BehaviorRelay<[Product]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: false)
    let error = PublishSubject<Error>()

    init(productService: ProductServiceProtocol) {
        self.productService = productService
    }

    func fetchProducts() {
        isLoading.accept(true)
        productService.fetchProducts()
            .subscribe(onNext: { [weak self] products in
                self?.isLoading.accept(false)
                self?.products.accept(products)
            }, onError: { [weak self] error in
                self?.isLoading.accept(false)
                self?.error.onNext(error)
            }).disposed(by: disposeBag)
    }
}
