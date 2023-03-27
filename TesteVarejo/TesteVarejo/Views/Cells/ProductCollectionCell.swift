//
//  ProductCollectionCell.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit
import SwiftyStarRatingView

class ProductCollectionCell: UICollectionViewCell {
    let imageView = UIImageView(frame: .zero )
    let nameLabel = UILabel()
    let rankView = SwiftyStarRatingView()
    let priceLabel = UILabel()
    
    func setup(name:String, url:URL, ranking:CGFloat, price:Double) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        rankView.value = ranking
        nameLabel.text = name
        priceLabel.text = "R$ " + moneyValueString(value: price)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(rankView)
        self.contentView.addSubview(priceLabel)
        setupView()
        setupConstrents()
    }
    
    func setupView() {
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 12)
        nameLabel.numberOfLines = 3
        rankView.tintColor = UIColor(hex: 0xFFB416)
        priceLabel.font = UIFont(name: "Helvetica-Bold", size: 14)
        priceLabel.textColor = UIColor(hex: 0x277BBE)
    }
    
    func setupConstrents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        rankView.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor),
            rankView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            rankView.leftAnchor.constraint(equalTo: leftAnchor),
            rankView.rightAnchor.constraint(equalTo: rightAnchor),
            priceLabel.topAnchor.constraint(equalTo: rankView.bottomAnchor),
            priceLabel.leftAnchor.constraint(equalTo: leftAnchor),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    ///handler
    ///
    func moneyValueString(value: Double) -> String {
        return String(format: "%.2f", value)
    }
}

extension ProductCollectionCell: ProductCellProtocol {
    func height() -> CGFloat {
        return 500
    }
}
