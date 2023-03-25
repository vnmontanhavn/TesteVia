//
//  DetailCaller.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 25/03/23.
//

import Foundation
import Alamofire

class DetailCaller {
    func getDetail(completion: @escaping (DetailModel) -> Void) {
        AF.request("https://www.mocky.io/v2/5d1b4fd23400004c000006e1").responseJSON { response in
            
            do {
                let decoder = JSONDecoder()
                if let value = response.data as? Data {
                    let myResponse = try decoder.decode(DetailModel.self, from: value)
                    completion(myResponse)
                }
            }
            catch {
                print("JSONSerialization error:", error)
            }
        }
    }
}
