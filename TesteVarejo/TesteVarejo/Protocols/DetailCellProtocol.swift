//
//  DetailCellProtocol.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

//protocolo unificado para as celulas, é usado pela tableview e pelo builder
protocol DetailCellProtocol {
    func height() -> CGFloat
    func getCell() -> UITableViewCell
    func getIdentifier() -> String
}

protocol ProductCellProtocol {
    func height() -> CGFloat
    func getCell() -> UICollectionViewCell
    func getIdentifier() -> String
}

//implementaçoes que são defaut e ultilitarias são fetas aqui
extension DetailCellProtocol {
    func getCell() -> UITableViewCell {
        if let cell = self as? UITableViewCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func getIdentifier() -> String {
        return String(describing: type(of: self))
    }
}

extension ProductCellProtocol {
    func getCell() -> UICollectionViewCell {
        if let cell = self as? UICollectionViewCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func getIdentifier() -> String {
        return String(describing: type(of: self))
    }
}
