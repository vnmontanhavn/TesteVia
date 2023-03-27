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
    private var dots = UIPageControl()
    //recebe as urls das imagens
    public init(urls: [URL]) {
            self.urls = urls
        super.init(frame: .zero)
            setupCarrossel()
        }

        // caso fosse inicializado por uma Xib/StoryBoard
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupCarrossel()
        }
    //configura a view
    func setupCarrossel() {
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        dots.translatesAutoresizingMaskIntoConstraints = false
        dots.pageIndicatorTintColor = .gray
        dots.currentPageIndicatorTintColor = .black
        addSubview(collectionView)
        addSubview(dots)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        setupConstraints()
    }
    //configura as constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dots.bottomAnchor.constraint(equalTo: bottomAnchor),
            dots.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    //faz o controle do page indicator
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dots.currentPage = Int(
            (collectionView.contentOffset.x / collectionView.frame.width)
                .rounded(.toNearestOrAwayFromZero)
            )
    }
    
}
///implementações
//implementa o datasource da collection
extension Carrossel: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dots.numberOfPages = self.urls.count
        return self.urls.count
    }
    //implementa cellForItem
    //por não ter celulas complexas mantive esse identifier hardcoded
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView: UIImageView = UIImageView(frame: .zero )
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                imageView.sd_setImage(with: urls[indexPath.row], placeholderImage: UIImage(named: "placeholder"))
                cell.contentView.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: cell.topAnchor),
                    imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
                    imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
                    imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor)
                ])
                return cell
    }
    
}
