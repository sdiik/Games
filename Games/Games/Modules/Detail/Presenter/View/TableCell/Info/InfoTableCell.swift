//
//  InfoTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

final class InfoTableCell: UITableViewCell {
    @IBOutlet weak var genreGameLabel: UILabel!
    @IBOutlet weak var titleGameLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var totalPlayerLabel: UILabel!
    
    var detailGame: DetailItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: DetailItemModel?) {
        detailGame = data
        setTitle()
        setRating()
        setReleased()
        setPlayTime()
    }
    
    private func setTitle() {
        titleGameLabel.text = detailGame?.name ?? ""
    }
    
    private func setRating() {
        ratingLabel.text = "\(detailGame?.rating ?? 0.0)"
    }
    
    private func setReleased() {
        releasedLabel.text = "Release date \(detailGame?.released ?? "-")"
    }
    
    private func setPlayTime() {
        totalPlayerLabel.text = "\(detailGame?.playtime ?? 0) played"
    }
    
}
