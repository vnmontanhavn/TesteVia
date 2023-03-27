//
//  ProductGalleryViewController.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

class ProductGalleryViewController: UIViewController {
    private lazy var collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: ProductsFlowLayout()
        )
    private var cells: [ProductCellProtocol] = []
    private var model: ProductsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionCell.self, forCellWithReuseIdentifier: ProductCollectionCell().getIdentifier())
        setupConstraints()
        setupNavigationController()
        title = "Smart TVs"
    }
    override func viewDidAppear(_ animated: Bool) {
        ProductsCaller().getProducts { response in
            DispatchQueue.main.async {
                self.model = response
                self.collectionView.reloadData()
                
            }
        }
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor(hex: 0x023866)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(hex: 0x023866)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func setupConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
    
}
extension ProductGalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.products.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell().getIdentifier(), for: indexPath)
        if let pcell = cell as? ProductCollectionCell, let item = model?.products[indexPath.item], let url = imageURLs(urlStr: item.imageUrl) {
            
            pcell.setup(name: item.name, url: url, ranking: CGFloat(item.ranking), price: item.price.nowPryce)
        }
        return cell //self.cells[indexPath.item].getCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    func imageURLs(urlStr: String) -> URL? {
        let fixUrl = urlStr.replacingOccurrences(of: "http://", with: "https://")
        if let url = URL(string: fixUrl){
        return url
        }
        return nil
    }
}
