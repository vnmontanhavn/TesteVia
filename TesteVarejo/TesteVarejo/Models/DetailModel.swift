//
//  detailModel.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 24/03/23.
//

import Foundation


struct DetailModel: Decodable {
    let id: String
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
    init(from decoder: Decoder) throws {
        self.id = ""
        self.name = ""
        self.description = ""
        self.withdraw = false
        self.categories = []
        self.moreInfo = []
        self.brand = DetailBrandModel(id: 0, name: "")
        self.style = DetailStyleModel(skus: [], pattern: StylePatternModel(sku: 0, name: "", disponibility: false, marketPlace: PatternMarketPlaceModel(greaterPrice: 0, minorPrice: 0, standerdShop: MarketPlaceShopModel(id: 0, name: "", price: 0, fastWithdrawal: false, onlineShop: false, elected: false), featuredStores: []), price: PatternPriceModel(paymentPlan: "", parcelValue: 0, maxParcelQtd: 0, yearValue: 0, discountPercentage: 0, discountPaymentWay: PricePaymentWayModel(price: 0, hasDiscount: false, percentageDiscount: 0)), images: [], services: []))
    }
    
    init( id: String,
     name: String,
     description: String,
     withdraw: Bool,
     categories: [DetailCategoryModel],
     moreInfo: [DetailMoreInfoModel],
     brand: DetailBrandModel,
     style: DetailStyleModel) {
        self.id = id
        self.name = name
        self.description = description
        self.withdraw = withdraw
        self.categories = categories
        self.moreInfo = moreInfo
        self.brand = brand
        self.style = style
    }
}

struct DetailCategoryModel {
    let id: Int
    let description: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case description = "descricao"
    }
}

struct DetailMoreInfoModel {
    let descripition: String
    let values: [MoreInfoValueModel]

    private enum CodingKeys: String, CodingKey {
        case descripition = "descricao"
        case values = "valores"
    }
}

struct MoreInfoValueModel {
    let name: String
    let value: String
    private enum CodingKeys: String, CodingKey {
        case name = "nome"
        case values = "valor"
    }
}

struct DetailBrandModel {
    let id: Int
    let name: String
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "nome"
    }
}

struct DetailStyleModel {
    let skus: [Int]
    let pattern: StylePatternModel
}

struct StylePatternModel {
    let sku: Int
    let name: String
    let disponibility: Bool
    let marketPlace: PatternMarketPlaceModel
    let price: PatternPriceModel
    let images:[PatternImagesModel]
    let services: [PatternServiceModel]
}

struct PatternServiceModel {
    let name: String
    let sku: Int
    let idShop: Int
    let price: Double
    let installment: String
    let type: String
}

struct PatternImagesModel {
    let id: Int
    let name: String
    let hight: Float
    let width: Float
    let url: String
}

struct PatternPriceModel {
    let paymentPlan: String
    let parcelValue: Double
    let maxParcelQtd: Int
    let yearValue: Double
    let discountPercentage: Int
    let discountPaymentWay: PricePaymentWayModel

}

struct PricePaymentWayModel {
    let price: Double
    let hasDiscount: Bool
    let percentageDiscount: Double
}

struct PatternMarketPlaceModel {
    let greaterPrice: Double
    let minorPrice: Double
    let standerdShop: MarketPlaceShopModel
    let featuredStores: [MarketPlaceShopModel]

}

struct MarketPlaceShopModel {
    let id: Int
    let name: String
    let price: Double
    let fastWithdrawal: Bool
    let onlineShop: Bool
    let elected: Bool
}
