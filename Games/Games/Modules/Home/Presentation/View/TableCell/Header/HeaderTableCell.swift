//
//  HeaderTableCell.swift
//  Games
//
//  Created by ahmad shiddiq on 15/08/23.
//

import Foundation
import UIKit

class HeaderTableCell: UITableViewHeaderFooterView {
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    var search: (_ keyword: String)-> Void = {keyword in}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSearchDefault()
    }
}

extension HeaderTableCell: UISearchBarDelegate {
    private func setupSearchDefault() {
        searchBar.placeholder = "Search Games"
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let alreadyKeyword = searchBar.text {
            search(alreadyKeyword)
            searchBar.resignFirstResponder()
        }
    }
}
