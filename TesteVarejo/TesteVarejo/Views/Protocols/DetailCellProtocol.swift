//
//  DetailCellProtocol.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

protocol DetailCellProtocol {
    func height() -> CGFloat
    func getCell() -> UITableViewCell
    func getIdentifier() -> String
}
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
