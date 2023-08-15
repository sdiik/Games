//
//  PublisherItemCollectionCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class PublisherItemCollectionCell: UICollectionViewCell {
    @IBOutlet weak var publisherView: UIView!
    @IBOutlet weak var titlePublisherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupData(with data: PublishedDataModel?) {
        titlePublisherLabel.text = data?.name ?? ""
    }
    
}
