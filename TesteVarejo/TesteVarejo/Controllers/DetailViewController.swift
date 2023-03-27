//
//  ViewController.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 23/03/23.
//

import UIKit

class DetailViewController: UIViewController {
    private let detailTableView:UITableView = UITableView() // view
    private var cells: [DetailCellProtocol] = []
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailTableView.delegate = self
        detailTableView.dataSource = self
        view.addSubview(detailTableView)
        self.configConstraints()
        self.setupNavigationController()
        title = "Detalhes do Produto"
    }
    override func viewDidAppear(_ animated: Bool) {
        DetailCaller().getDetail { response in
            DispatchQueue.main.async {
                self.cells = DetailCellsBuilder().buildCells(tableview: self.detailTableView, detailModel: response)
                self.detailTableView.reloadData()
            }
        }
    }
    
    func setupNavigationController() {
        self.navigationController?.navigationBar.backgroundColor = UIColor(hex: 0x023866)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(hex: 0x023866)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    func configConstraints() {
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        detailTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        detailTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        detailTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
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
