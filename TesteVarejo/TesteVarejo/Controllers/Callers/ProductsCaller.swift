//
//  ProductsCaller.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 26/03/23.
//

import Foundation
import Alamofire

class ProductsCaller {
    func getProducts(completion: @escaping (ProductsModel) -> Void) {
        AF.request("https://www.mocky.io/v2/5d1b4f0f34000074000006dd").responseJSON { response in
            
            do {
                let decoder = JSONDecoder()
                if let value = response.data {
                    let myResponse = try decoder.decode(ProductsModel.self, from: value)
                    completion(myResponse)
                }
            }
            catch {
                print("JSONSerialization error:", error)
            }
        }
    }
}
