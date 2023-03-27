//
//  ProductsCellBuilder.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 27/03/23.
//

import Foundation
import UIKit

class ProductsCellBuilder {
    func buildCells(collection: UICollectionView, productsModel: ProductsModel? = nil) -> [ProductCellProtocol] {
        var cells: [ProductCellProtocol] = []
        if let itens = productsModel?.products {
            for item in itens {
                cells.append(buildProductCell(collection: collection, product: item))
            }
        }
        
        return cells
    }
    
    func buildProductCell(collection: UICollectionView, product: ProductModel) -> ProductCellProtocol {
        let cell = ProductCollectionCell()
        collection.register(ProductCollectionCell.self, forCellWithReuseIdentifier: cell.getIdentifier())
        if let url = imageURLs(urlStr: product.imageUrl) {
            cell.setup(name: product.name, url: url, ranking: CGFloat(product.ranking) , price: product.price.nowPryce)
        }
        return cell
    }
    
    func imageURLs(urlStr: String) -> URL? {
        let fixUrl = urlStr.replacingOccurrences(of: "http://", with: "https://")
        if let url = URL(string: fixUrl){
        return url
        }
        return nil
    }
}
