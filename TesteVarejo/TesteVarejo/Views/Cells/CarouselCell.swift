//
//  CarouselCell.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

class CarouselCell: UITableViewCell {
    func setupWith(urls: [URL]) {
        let view = Carrossel(urls: urls)
        self.contentView.addSubview(view)
        self.configConstraints(view: view)
        self.isUserInteractionEnabled = true
    }
    func configConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo:self.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo:self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo:self.rightAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo:self.bottomAnchor).isActive = true
    }
}
extension CarouselCell: DetailCellProtocol {
    func height() -> CGFloat {
        return 300
    }
}
