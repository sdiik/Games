//
//  DescriptionTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

final class DescriptionTableCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: DetailItemModel?) {
        if let alreadyDescription = data?.description {
            descriptionLabel.text = alreadyDescription.htmlStripped
        }
    }
}
