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
    var selectedIndex: Int = 0
    private var timer: Timer?
    
    public init(urls: [URL]) {
            self.urls = urls
        super.init(frame: .zero)
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
                
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dots.bottomAnchor.constraint(equalTo: bottomAnchor),
            dots.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        dots.currentPage = Int(
            (collectionView.contentOffset.x / collectionView.frame.width)
                .rounded(.toNearestOrAwayFromZero)
            )
    }
    
}

extension Carrossel: UICollectionViewDelegate {
}

extension Carrossel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dots.numberOfPages = self.urls.count
        return self.urls.count
    }
    
   
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
