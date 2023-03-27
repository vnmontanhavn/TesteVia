//
//  ProductsModel.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation

struct ProductsModel: Decodable {
    let products: [ProductModel]
    let amount: Int
    private enum CodingKeys: String, CodingKey {
        case products = "produtos"
        case amount = "quantidade"
    }
}

struct ProductModel: Decodable {
    let id: Int
    let name: String
    let available: Bool
    let imageUrl: String
    let ranking: Int
    let price: PriceModel
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case available = "disponivel"
        case imageUrl = "imagemUrl"
        case ranking = "classificacao"
        case price = "preco"
    }
}

struct PriceModel: Decodable {
    let paymentPlan: String
    let parcelValue: Double
    let maxParcelQtd: Int
    let nowPryce: Double
    let lastPrice: Double
    let discountPercentage: Int
    private enum CodingKeys: String, CodingKey {
        case paymentPlan = "planoPagamento"
        case parcelValue = "valorParcela"
        case maxParcelQtd = "quantidadeMaximaParcelas"
        case nowPryce = "precoAtual"
        case lastPrice = "precoAnterior"
        case discountPercentage = "porcentagemDesconto"
    }
}
