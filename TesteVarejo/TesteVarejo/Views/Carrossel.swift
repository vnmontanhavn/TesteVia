//
//  Carrossel.swift
//  TesteVarejo
//
//  Created by Vinicius Soares Lima on 23/03/23.
//

import Foundation
import UIKit
import SDWebImage

class Carrossel: UIView {
    private var urls: [URL] = []
    private lazy var collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: CarrosselFlowLayout()
        )
    
    public init(frame: CGRect, urls: [URL]) {
            self.urls = urls
            super.init(frame: frame)
            setupCarrossel()
        }

        // init from code
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupCarrossel()
        }

        // init from xib or storyboard
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupCarrossel()
        }
    func setupCarrossel() {
        collectionView.backgroundColor = .clear
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.isUserInteractionEnabled = false
                collectionView.isPagingEnabled = true
                
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                addSubview(collectionView)
                
                collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
                
                NSLayoutConstraint.activate([
                    collectionView.topAnchor.constraint(equalTo: topAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
                ])
    }
}

extension Carrossel: UICollectionViewDelegate {
    
}

extension Carrossel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.urls.count
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let url = self.urls[indexPath.item]
        let imageView: UIImageView = UIImageView(frame: .zero )
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .center
                imageView.sd_setImage(with: urls[indexPath.row], placeholderImage: UIImage(named: "placeholder"))
                cell.contentView.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: cell.topAnchor),
                    imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                    imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                    imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor)
                ])
                return cell
        return UICollectionViewCell()
    }
    
}
