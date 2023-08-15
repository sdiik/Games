//
//  PublisherTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class PublisherTableCell: UITableViewCell {
    @IBOutlet weak var publishedCollectionView: UICollectionView! {
        didSet {
            publishedCollectionView.delegate = self
            publishedCollectionView.dataSource = self
        }
    }
    
    var publishers = [PublishedDataModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setRegisterCell()
    }
    
    private func setRegisterCell() {
        publishedCollectionView.register(
            UINib(nibName: CollectionCells.Cell.publisher, bundle: nil),
            forCellWithReuseIdentifier: CollectionCells.Cell.publisher)
    }
    
    internal func setupView(with data: DetailItemModel?){
        if let alreadyPublished = data?.publishers {
            publishers = alreadyPublished
            publishedCollectionView.reloadData()
        }
    }
}
extension PublisherTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return publishers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.collectionView(collectionView, cellForPublisherItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForPublisherItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionCells.Cell.publisher,
            for: indexPath) as? PublisherItemCollectionCell else {
            return UICollectionViewCell()
        }
        cell.setupData(with: publishers[indexPath.item])
        return cell
    }
}
