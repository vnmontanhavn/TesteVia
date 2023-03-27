//
//  PriceCell.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

class PriceCell: UITableViewCell {
    let priceLabel = UILabel()
    let oldPriceLabel = UILabel()
    let parceladoLabel = UILabel()
    let discountLabel = UILabel()
    
    func setup(price: Double, oldPrice: Double, parcelas: Int, parcelaValue: Double, discount:Int) {
        
        priceLabel.text = "R$ \(moneyValueString(value: price))"
        let attString =  NSMutableAttributedString(string: "R$ \(moneyValueString(value: oldPrice))")
        attString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attString.length))
        oldPriceLabel.attributedText = attString
        parceladoLabel.text = parcelas > 1 ? "ou em até \(parcelas)x de \(moneyValueString(value: parcelaValue))" : ""
        discountLabel.text = "- \(discount)%"
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(oldPriceLabel)
        self.contentView.addSubview(parceladoLabel)
        self.contentView.addSubview(discountLabel)
        setupLabel()
        setupConstraints()
    }
    
    func setupLabel() {
        oldPriceLabel.font = UIFont(name: "Helvetica", size: 14)
        oldPriceLabel.textColor = .gray
        priceLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        priceLabel.textColor = UIColor(hex: 0x277BBE)
        parceladoLabel.font = UIFont(name: "Helvetica", size: 10)
        discountLabel.font = UIFont(name: "Helvetica-Bold", size: 12)
        discountLabel.backgroundColor = UIColor(hex: 0xFFB416)
        discountLabel.layer.cornerRadius = 10
        discountLabel.layer.masksToBounds = true
        discountLabel.textAlignment = .center
    }
    
    func setupConstraints() {
        oldPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        parceladoLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        oldPriceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        oldPriceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        priceLabel.topAnchor.constraint(equalTo: oldPriceLabel.bottomAnchor, constant: 3).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: oldPriceLabel.leftAnchor).isActive = true
        parceladoLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 3).isActive = true
        parceladoLabel.leftAnchor.constraint(equalTo: priceLabel.leftAnchor).isActive = true
        discountLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: -3).isActive = true
        discountLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 5).isActive = true
        discountLabel.widthAnchor.constraint(equalToConstant: 45).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func moneyValueString(value: Double) -> String {
        return String(format: "%.2f", value)
    }
}

extension PriceCell: DetailCellProtocol {
    func height() -> CGFloat {
        return 70
    }
}
