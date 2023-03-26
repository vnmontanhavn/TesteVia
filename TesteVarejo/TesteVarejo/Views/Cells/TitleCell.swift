//
//  TitleCell.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

class TitleCell: UITableViewCell {
    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    
    func setup( title: String, subtitle: Int) {
        titleLabel.text = title
        subTitleLabel.text = "Cód. Item: \(subtitle)"
        labelSetup()
        constraintsSetup()
    }
    
    func labelSetup() {
        titleLabel.font = UIFont(name: "Helvetica", size: 14)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        subTitleLabel.font = UIFont(name: "Helvetica", size: 10)
        subTitleLabel.textColor = .gray
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitleLabel)
    }
    
    func constraintsSetup() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo:self.topAnchor, constant: 16).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 16).isActive = true
        titleLabel.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 20).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
    
    
}

extension TitleCell: DetailCellProtocol {
    func height() -> CGFloat {
        let cellHeight = titleLabel.frame.height + 60
        return cellHeight
    }
    
    
}
