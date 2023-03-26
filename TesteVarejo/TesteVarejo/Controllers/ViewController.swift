//
//  ViewController.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 23/03/23.
//

import UIKit

class ViewController: UIViewController {
    let detailTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        DetailCaller().getDetail { response in
            print (response.name)
        }
    }

}

