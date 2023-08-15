//
//  GameTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

final class GameTableCell: UITableViewCell {
    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var gameItem: GameItemDataModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func setupView(with data: GameItemDataModel?) {
        gameItem = data
        setTitle()
        setReleased()
        setRating()
        loadImageGame()
    }
    
    private func setTitle() {
        titleLabel.text = gameItem?.name ?? ""
    }
    
    private func setReleased() {
        var released = "Release date "
        released += "\(gameItem?.released ?? "-")"
        descriptionLabel.text = released
    }
    
    private func setRating() {
        ratingLabel.text = "\(gameItem?.rating ?? 0.0)"
    }
    
    private func loadImageGame() {
        guard let alreadyImageURL = gameItem?.backgroundImage else { return }
        gameImageView.loadImageUsingCache(withUrl: alreadyImageURL)
    }
    
}
