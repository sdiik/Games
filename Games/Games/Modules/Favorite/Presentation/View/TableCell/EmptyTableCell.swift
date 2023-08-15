//
//  EmptyTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import UIKit

final class EmptyTableCell: UITableViewCell {
    @IBOutlet weak var emptyImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
