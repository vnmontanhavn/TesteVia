//
//  detailModel.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 24/03/23.
//

import Foundation


struct DetailModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let withdraw: Bool
    let categories: [DetailCategoryModel]
    let moreInfo: [DetailMoreInfoModel]
    let brand: DetailBrandModel
    let style: DetailStyleModel
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case description = "descricao"
        case withdraw = "retiraEmLoja"
        case categories = "categorias"
        case moreInfo = "maisInformacoes"
        case brand = "marca"
        case style = "modelo"
    }
}

struct DetailCategoryModel: Decodable {
    let id: Int
    let description: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "descricao"
    }
}

struct DetailMoreInfoModel: Decodable {
    let descripition: String
    let values: [MoreInfoValueModel]

    private enum CodingKeys: String, CodingKey {
        case descripition = "descricao"
        case values = "valores"
    }
}

struct MoreInfoValueModel: Decodable {
    let name: String
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "nome"
        case value = "valor"
    }
}

struct DetailBrandModel: Decodable {
    let id: Int
    let name: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
    }
}

struct DetailStyleModel: Decodable {
    let skus: [Int]
    let pattern: StylePatternModel
    private enum CodingKeys: String, CodingKey {
        case skus = "skus"
        case pattern = "padrao"
    }
}

struct StylePatternModel: Decodable {
    let sku: Int
    let name: String
    let disponibility: Bool
    let marketPlace: PatternMarketPlaceModel
    let price: PatternPriceModel
    let images:[PatternImagesModel]
    let services: [PatternServiceModel]
    private enum CodingKeys: String, CodingKey {
        case sku = "sku"
        case name = "nome"
        case disponibility = "disponivel"
        case marketPlace = "marketplace"
        case price = "preco"
        case images = "imagens"
        case services = "servicos"
    }
    
}

struct PatternServiceModel: Decodable {
    let name: String
    let sku: Int
    let idShop: Int
    let price: Double
    let installment: String
    let type: String
    private enum CodingKeys: String, CodingKey {
        case name = "nome"
        case sku = "sku"
        case idShop = "idLojista"
        case price = "preco"
        case installment = "parcelamento"
        case type = "tipo"
    }
}

struct PatternImagesModel: Decodable {
    let id: Int
    let name: String
    let hight: Float
    let width: Float
    let url: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case hight = "altura"
        case width = "largura"
        case url = "url"
    }
}

struct PatternPriceModel: Decodable {
    let paymentPlan: String
    let parcelValue: Double
    let maxParcelQtd: Int
    let yearValue: Double
    let lastPrice: Double
    let discountPercentage: Int
    let discountPaymentWay: PricePaymentWayModel
    private enum CodingKeys: String, CodingKey {
        case paymentPlan = "planoPagamento"
        case parcelValue = "valorParcela"
        case maxParcelQtd = "quantidadeMaximaParcelas"
        case yearValue = "precoAtual"
        case lastPrice = "precoAnterior"
        case discountPercentage = "porcentagemDesconto"
        case discountPaymentWay = "descontoFormaPagamento"
    }
}

struct PricePaymentWayModel: Decodable {
    let price: Double
    let hasDiscount: Bool
    let percentageDiscount: Double
    private enum CodingKeys: String, CodingKey {
        case price = "preco"
        case hasDiscount = "possuiDesconto"
        case percentageDiscount = "porcentagemDesconto"
    }
}

struct PatternMarketPlaceModel: Decodable {
    let greaterPrice: Double
    let minorPrice: Double
    let standerdShop: MarketPlaceShopModel
    let featuredStores: [MarketPlaceShopModel]
    private enum CodingKeys: String, CodingKey {
        case greaterPrice = "maiorPreco"
        case minorPrice = "menorPreco"
        case standerdShop = "lojistaPadrao"
        case featuredStores = "lojistasEmDestaque"
    }
}

struct MarketPlaceShopModel: Decodable {
    let id: Int
    let name: String
    let price: Double
    let fastWithdrawal: Bool
    let onlineShop: Bool
    let elected: Bool
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
        case price = "preco"
        case fastWithdrawal = "retiraRapido"
        case onlineShop = "compraOnline"
        case elected = "eleito"
    }
}
