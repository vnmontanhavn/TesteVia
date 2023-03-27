//
//  ViewController.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 23/03/23.
//

import UIKit

class ViewController: UIViewController {
    private let detailTableView:UITableView = UITableView() // view
    private var cells: [DetailCellProtocol] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailTableView.delegate = self
        detailTableView.dataSource = self
        view.addSubview(detailTableView)
        self.configConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        DetailCaller().getDetail { response in
            print (response.name)
            DispatchQueue.main.async {
                self.cells = DetailCellsBuilder().buildCells(tableview: self.detailTableView, detailModel: response)
                self.detailTableView.reloadData()
            }
        }
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor(hex: 0x023866)
    }
    
    func configConstraints() {
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        detailTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        detailTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.cells[indexPath.item].getCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cells[indexPath.item].height()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cells[indexPath.item].height()
    }
    
}
