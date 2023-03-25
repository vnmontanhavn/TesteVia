//
//  ViewController.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 23/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        DetailCaller().getDetail { response in
            print (response.name)
        }
    }

}

