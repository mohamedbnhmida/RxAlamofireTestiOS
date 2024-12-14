//
//  ViewController.swift
//  RxAlamofire
//
//  Created by Mohamed Ben Hmida on 2024/06/21.
//import UIKit
import RxSwift
import RxCocoa

class ProductListViewController: UIViewController {
    private let collectionView: UICollectionView
    private let viewModel: ProductListViewModel
    private let disposeBag = DisposeBag()
    let s : String? = ""

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 120)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        // Assuming you have a way to instantiate viewModel in case of storyboard initialization
        self.viewModel = ProductListViewModel(productService: ProductService(apiClient: APIClient()))
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 120)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindings()
        viewModel.fetchProducts()
        let a = s!
    }

    private func setupViews() {
        title = "Products"
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupBindings() {
        viewModel.products
            .bind(to: collectionView.rx.items(cellIdentifier: ProductCollectionViewCell.identifier, cellType: ProductCollectionViewCell.self)) { row, product, cell in
                cell.configure(with: product)
            }
            .disposed(by: disposeBag)
        
        viewModel.isLoading
            .bind(to: UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        viewModel.error
            .subscribe(onNext: { error in
                print("Error: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}
