//
//  Builder.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import UIKit

//construtor de celulas
class DetailCellsBuilder {
    //metodo responsavel por orquestrar o array de celulas usado na tableview, retirando responsabilidade da viewcontroller
    func buildCells(tableview: UITableView, detailModel: DetailModel? = nil) -> [DetailCellProtocol] {
        guard let detailModel = detailModel else {
            return []
        }
        var cells: [DetailCellProtocol] = []
        let imagesData = imageURLs(imageModelArray: detailModel.style.pattern.images)
        cells.append(buildCarouselCell(tableview: tableview, urls: imagesData))
        cells.append(buildTitleCell(tableview: tableview, data: detailModel))
        cells.append(buildPriceCell(tableView: tableview, data: detailModel.style.pattern.price))
        return cells
    }
    //construtor da celula de carrossel
    func buildCarouselCell(tableview: UITableView, urls: [URL]) -> DetailCellProtocol {
        let cell = CarouselCell()
        cell.setupWith(urls: urls)
        tableview.register(CarouselCell.self, forCellReuseIdentifier: cell.getIdentifier())
        return cell
    }
    //construtor da celula de titulo
    func buildTitleCell(tableview: UITableView, data: DetailModel) -> DetailCellProtocol {
        let cell = TitleCell()
        cell.setup(title: data.name, subtitle: data.id)
        tableview.register(TitleCell.self, forCellReuseIdentifier: cell.getIdentifier())
        return cell
    }
    //construtor da celula de preço
    func buildPriceCell(tableView: UITableView, data: PatternPriceModel) -> DetailCellProtocol {
        let cell = PriceCell()
        cell.setup(price: data.nowPryce, oldPrice: data.lastPrice, parcelas: data.maxParcelQtd, parcelaValue: data.parcelValue, discount: data.discountPercentage)
        tableView.register(PriceCell.self, forCellReuseIdentifier: cell.getIdentifier())
        return cell
    }
    
    ///helpers
    //faz o ajuste das urls vindas do serviço, pois vem http que é inseguro para o sistema, por isso precisa ser convertido para um protocolo seguro https
    func imageURLs(imageModelArray: [PatternImagesModel]) -> [URL] {
        var urls: [URL] = []
        for item in imageModelArray {
            let fixUrl = item.url.replacingOccurrences(of: "http://", with: "https://")
            if let url = URL(string: fixUrl){
                urls.append(url)
            }
        }
        return urls
    }
}
